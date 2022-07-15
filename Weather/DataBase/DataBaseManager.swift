//
//  DataBaseManager.swift
//  Weather
//
//  Created by GiN Eugene on 6/7/2022.
//

import Foundation
import UIKit
import CoreData

protocol DataBaseManagerProtocol {
    func getAllForecast() -> [Forecast?]
    func deleteForecastFromDB(_ forecast: ForecastModel)
    func updateForecastToDB(_ forecast: ForecastModel, _ city: NameCityModel)
    func addForecastToDB(_ forecast: ForecastModel, _ city: NameCityModel)
}

class DataBaseManager: DataBaseManagerProtocol {
    //MARK: - props
    
    static let shared = DataBaseManager()
    
    private let persistentContainer: NSPersistentContainer
    private lazy var backgroundContext = persistentContainer.newBackgroundContext()
    
    //MARK: - init
    
    init() {
        let container = NSPersistentContainer(name: "DataBaseModel")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        self.persistentContainer = container
    }
    //MARK: - methods
    
    func getAllForecast() -> [Forecast?] {
        let fetchRequestF = Forecast.fetchRequest()
        fetchRequestF.returnsObjectsAsFaults = false
        fetchRequestF.relationshipKeyPathsForPrefetching = ["currentForecast" , "dailyForecasts", "hourlyForecasts"]
        var forecastArray: [Forecast]?
        do {
            forecastArray = try persistentContainer.viewContext.fetch(fetchRequestF)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return forecastArray ?? []
    }
    
    func deleteForecastFromDB(_ forecast: ForecastModel) {
        backgroundContext.perform { [weak self] in
            guard let self = self else { return }
            
            let fetchRequest = Forecast.fetchRequest()
            
            do {
                let fArr = try self.persistentContainer.viewContext.fetch(fetchRequest)
                fArr.forEach {
                    if ($0.lon == forecast.lon && $0.lat == forecast.lat) {
                        self.persistentContainer.viewContext.delete($0)
                        print("Forecast has been deleted!")
                    }
                }
                try self.persistentContainer.viewContext.save()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    func updateForecastToDB(_ forecast: ForecastModel, _ city: NameCityModel) {
        self.deleteForecastFromDB(forecast)
        self.addForecastToDB(forecast, city)
    }
    
    func addForecastToDB(_ forecast: ForecastModel, _ city: NameCityModel) {
        backgroundContext.perform { [weak self] in
            guard let self = self else { return }
            
            do {
                if let newSet = NSEntityDescription.insertNewObject(forEntityName: "Forecast", into: self.backgroundContext) as? Forecast {
                    newSet.lon = forecast.lon
                    newSet.lat = forecast.lat
                    newSet.city = city.name
                    newSet.country = city.country
                    newSet.timezoneOffset = Int64(forecast.timezoneOffset)
                    
                    if let newSetCurrent = NSEntityDescription.insertNewObject(forEntityName: "Current", into: self.backgroundContext) as? Current {
                        
                        newSetCurrent.currentTime = Int64(forecast.currentTime)
                        newSetCurrent.sunrise = Int64(forecast.sunrise)
                        newSetCurrent.sunset = Int64(forecast.sunset)
                        newSetCurrent.temp = forecast.temp
                        newSetCurrent.feelsLike = forecast.feelsLike
                        newSetCurrent.humidity = Int64(forecast.humidity)
                        newSetCurrent.uvi = forecast.uvi
                        newSetCurrent.clouds = Int64(forecast.clouds)
                        newSetCurrent.windSpeed = forecast.windSpeed
                        newSetCurrent.windDeg = Int64(forecast.windDeg)
                        
                        if let newSetWeather = NSEntityDescription.insertNewObject(forEntityName: "CWeather", into: self.backgroundContext) as? CWeather {
                            newSetWeather.descript = forecast.weather[0].descript
                            try self.backgroundContext.save()
                            newSetCurrent.currentWeather = newSetWeather
                            //                            print("cWeather has been added!")
                        } else {
                            fatalError("Unable to insert cWeather entity")
                        }
                        
                        try self.backgroundContext.save()
                        newSet.currentForecast = newSetCurrent
                        //                        print("Current has been added!")
                    } else {
                        fatalError("Unable to insert Current entity")
                    }
                    
                    for i in 0..<forecast.daily.count {
                        if let newSetDaily = NSEntityDescription.insertNewObject(forEntityName: "Daily", into: self.backgroundContext) as? Daily {
                            
                            let daily = forecast.daily[i]
                            
                            newSetDaily.dClouds = Int64(daily.dClouds)
                            newSetDaily.dTime = Int64(daily.dTime)
                            newSetDaily.dMoonPhase = daily.dMoonPhase
                            newSetDaily.dMoonset = Int64(daily.dMoonset)
                            newSetDaily.dMoonrise = Int64(daily.dMoonrise)
                            newSetDaily.dSunrise = Int64(daily.dSunrise)
                            newSetDaily.dSunset  = Int64(daily.dSunset)
                            newSetDaily.dPop = daily.dPop
                            newSetDaily.dUVI = daily.dUVI
                            newSetDaily.dWindDeg = Int64(daily.dWindDeg)
                            newSetDaily.dWindSpeed = daily.dWindSpeed
                            newSetDaily.dFeelsTemp = daily.dFeelsTemp
                            newSetDaily.nFeelsTemp = daily.nFeelsTemp
                            newSetDaily.dTempDay = daily.dTempDay
                            newSetDaily.dTempMax = daily.dTempMax
                            newSetDaily.dTempMin = daily.dTempMin
                            newSetDaily.dTempNight = daily.dTempNight
                            
                            if let newSetWeather = NSEntityDescription.insertNewObject(forEntityName: "DWeather", into: self.backgroundContext) as? DWeather {
                                newSetWeather.descript = daily.dWeather[0].descript
                                try self.backgroundContext.save()
                                newSetDaily.dailyWeather = newSetWeather
                                //                                print("dWeather has been added!")
                            } else {
                                fatalError("Unable to insert dWeather entity")
                            }
                            
                            try self.backgroundContext.save()
                            newSet.addToDailyForecasts(newSetDaily)
                        } else {
                            fatalError("Unable to insert Daily entity")
                        }
                    }
                    
                    for i in 0..<forecast.hourly.count {
                        if let newSetHourly = NSEntityDescription.insertNewObject(forEntityName: "Hourly", into: self.backgroundContext) as? Hourly {
                            
                            let hourly = forecast.hourly[i]
                            
                            newSetHourly.hClouds = Int64(hourly.hClouds)
                            newSetHourly.hTime = Int64(hourly.hTime)
                            newSetHourly.hFeelsLike = hourly.hFeelsLike
                            newSetHourly.hPop = hourly.hPop
                            newSetHourly.hTemp = hourly.hTemp
                            newSetHourly.hWindDeg = Int64(hourly.hWindDeg)
                            newSetHourly.hWindSpeed = hourly.hWindSpeed
                            
                            if let newSetWeather = NSEntityDescription.insertNewObject(forEntityName: "HWeather", into: self.backgroundContext) as? HWeather {
                                newSetWeather.descript = hourly.hWeather[0].descript
                                try self.backgroundContext.save()
                                newSetHourly.hourlyWeather = newSetWeather
                                //                                print("hWeather has been added!")
                            } else {
                                fatalError("Unable to insert hWeather entity")
                            }
                            
                            try self.backgroundContext.save()
                            newSet.addToHourlyForecasts(newSetHourly)
                            //                            print("Hourly has been added!")
                            
                            
                        } else {
                            fatalError("Unable to insert Hourly entity")
                        }
                    }
                    try self.backgroundContext.save()
                    print("Forecast has been added!")
                } else {
                    fatalError("Unable to insert Forecast entity")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
