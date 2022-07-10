//
//  CarouselViewModel.swift
//  Weather
//
//  Created by GiN Eugene on 7/7/2022.
//

import Foundation
import CoreLocation

struct ForecastStub {
    var city: String = ""
    var country: String = ""
    let lat: Double
    let lon: Double
    let current: [CurrentStub]
    var daily: [DailyStub]
    let hourly: [HourlyStub]
}

struct CurrentStub {
    let currentTime: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feelsLike: Double
    let humidity: Int
    let uvi: Double
    let clouds: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [WeatherStub]
}

struct WeatherStub {
    let descript: String
}

struct DailyStub {
    let dClouds: Int
    let dTime: Int
    let dMoonPhase: Double
    let dMoonrise: Int
    let dMoonset: Int
    let dSunrise: Int
    let dSunset: Int
    let dPop: Double
    let dUVI: Double
    let dWeather: [WeatherStub]
    let dWindDeg: Int
    let dWindSpeed: Double
    let dFeelsTemp: Double
    let nFeelsTemp: Double
    let dTempDay: Double
    let dTempMax: Double
    let dTempMin: Double
    let dTempNight: Double
}

struct HourlyStub {
    let hClouds: Int
    let hTime: Int
    let hFeelsLike: Double
    let hPop: Double
    let hTemp: Double
    let hWindDeg: Int
    let hWindSpeed: Double
    let hWeather: [WeatherStub]
}

struct CoordinateCityStub {
    let country: String
    let name: String
    let lat: Double
    let lon: Double
}

struct NameCityStub {
    let country: String
    let name: String
}

protocol CarouselViewModelProtocol {
    func getAllForecastFromDB(completition: @escaping ([ForecastStub]) -> Void)
    func addForecastToDB(_ coord: CLLocationCoordinate2D, comletition: @escaping (ForecastModel) -> Void)
//    func deleteForecastFromDB()
}

class CarouselViewModel: CarouselViewModelProtocol {
    //MARK: - props
    
    private let dataModel: ForecastDataModel
    
    var forecasts: [ForecastStub] = []
    
    //MARK: - init
    
    init(dataModel: ForecastDataModel) {
        self.dataModel = dataModel
    }
    //MARK: - methods
    
    func createCurrentForecastStub(_ model: ForecastModel?, completition: @escaping (ForecastStub) -> Void) {
        
        let newCWeather = WeatherStub(descript: model?.weather[0].descript ?? "no CW")
        
        let cur = model
        
        let newCurrent = CurrentStub(currentTime: Int(cur?.currentTime ?? 0),
                                     sunrise: Int(cur?.sunrise ?? 0),
                                     sunset: Int(cur?.sunset ?? 0),
                                     temp: cur?.temp ?? 0,
                                     feelsLike: cur?.feelsLike ?? 0,
                                     humidity: Int(cur?.humidity ?? 0),
                                     uvi: cur?.uvi ?? 0,
                                     clouds: Int(cur?.clouds ?? 0),
                                     windSpeed: cur?.windSpeed ?? 0,
                                     windDeg: Int(cur?.windDeg ?? 0),
                                     weather: [newCWeather])
        
        let dailyArr = model?.daily
        
        var newDailyArr: [DailyStub] = []
        if let uDailyArr = dailyArr {
            
            for (_, dayItem) in uDailyArr.enumerated() {
            
                let day = dayItem
                let newDWeather = WeatherStub(descript: day.dWeather[0].descript)
                
                let newD = DailyStub(dClouds: Int(day.dClouds),
                                     dTime: Int(day.dTime),
                                     dMoonPhase: day.dMoonPhase,
                                     dMoonrise: Int(day.dMoonrise),
                                     dMoonset: Int(day.dMoonset),
                                     dSunrise: Int(day.dSunrise),
                                     dSunset: Int(day.dSunset),
                                     dPop: day.dPop,
                                     dUVI: day.dUVI,
                                     dWeather: [newDWeather],
                                     dWindDeg: Int(day.dWindDeg),
                                     dWindSpeed: day.dWindSpeed,
                                     dFeelsTemp: day.dFeelsTemp,
                                     nFeelsTemp: day.nFeelsTemp,
                                     dTempDay: day.dTempDay,
                                     dTempMax: day.dTempMax,
                                     dTempMin: day.dTempMin,
                                     dTempNight: day.dTempNight)
                newDailyArr.append(newD)
            }
        }
        
        let hourlyArr = model?.hourly
        
        var newHourlyArr: [HourlyStub] = []
        if let uHourlyArr = hourlyArr {
            
            for (_, hItem) in uHourlyArr.enumerated() {
                
                let hour = hItem
                let newHWeather = WeatherStub(descript: hour.hWeather[0].descript)
                
                let newH = HourlyStub(hClouds: Int(hour.hClouds ),
                                      hTime: Int(hour.hTime),
                                      hFeelsLike: hour.hFeelsLike,
                                      hPop: hour.hPop,
                                      hTemp: hour.hTemp,
                                      hWindDeg: Int(hour.hWindDeg),
                                      hWindSpeed: hour.hWindSpeed,
                                      hWeather: [newHWeather])
                
                newHourlyArr.append(newH)
            }
        }
        
        let newForecast = ForecastStub(lat: model?.lat ?? 0,
                                       lon: model?.lon ?? 0,
                                       current: [newCurrent],
                                       daily: newDailyArr.sorted(by: { $0.dTime < $1.dTime }),
                                       hourly: newHourlyArr.sorted(by: { $0.hTime < $1.hTime }))
        forecasts.append(newForecast)
        completition(newForecast)
    }
    
    func getAllForecastFromDB(completition: @escaping ([ForecastStub]) -> Void) {
        let forecastArray = DataBaseManager.shared.getAllForecast()
        forecasts.removeAll()
        for (idx, item) in forecastArray.enumerated() {
            if let uItem = item {
                
                let newCWeather = WeatherStub(descript: forecastArray[idx]?.currentForecast?.currentWeather?.descript ?? "no CW")
                
                let cur = forecastArray[idx]?.currentForecast
                
                let newCurrent = CurrentStub(currentTime: Int(cur?.currentTime ?? 0),
                                             sunrise: Int(cur?.sunrise ?? 0),
                                             sunset: Int(cur?.sunset ?? 0),
                                             temp: cur?.temp ?? 0,
                                             feelsLike: cur?.feelsLike ?? 0,
                                             humidity: Int(cur?.humidity ?? 0),
                                             uvi: cur?.uvi ?? 0,
                                             clouds: Int(cur?.clouds ?? 0),
                                             windSpeed: cur?.windSpeed ?? 0,
                                             windDeg: Int(cur?.windDeg ?? 0),
                                             weather: [newCWeather])
                
                let dailyArr = forecastArray[idx]?.dailyForecasts
                
                var newDailyArr: [DailyStub] = []
                if let uDailyArr = dailyArr {
                    
                    
                    for (_, dayItem) in uDailyArr.enumerated() {
                        
                        let day = dayItem as AnyObject
                        let newDWeather = WeatherStub(descript: day.dailyWeather?.descript ?? "no DW")
                        
                        let newD = DailyStub(dClouds: Int(day.dClouds),
                                             dTime: Int(day.dTime),
                                             dMoonPhase: day.dMoonPhase,
                                             dMoonrise: Int(day.dMoonrise),
                                             dMoonset: Int(day.dMoonset),
                                             dSunrise: Int(day.dSunrise),
                                             dSunset: Int(day.dSunset),
                                             dPop: day.dPop,
                                             dUVI: day.dUVI,
                                             dWeather: [newDWeather],
                                             dWindDeg: Int(day.dWindDeg),
                                             dWindSpeed: day.dWindSpeed,
                                             dFeelsTemp: day.dFeelsTemp,
                                             nFeelsTemp: day.nFeelsTemp,
                                             dTempDay: day.dTempDay,
                                             dTempMax: day.dTempMax,
                                             dTempMin: day.dTempMin,
                                             dTempNight: day.dTempNight)
                        newDailyArr.append(newD)
                    }
                }
                
                let hourlyArr = forecastArray[idx]?.hourlyForecasts
                
                var newHourlyArr: [HourlyStub] = []
                if let uHourlyArr = hourlyArr {
                    
                    for (_, hItem) in uHourlyArr.enumerated() {
                        
                        let hour = hItem as AnyObject
                        let newHWeather = WeatherStub(descript: hour.hourlyWeather?.descript ?? "no HW")
                        
                        let newH = HourlyStub(hClouds: Int(hour.hClouds ),
                                              hTime: Int(hour.hTime),
                                              hFeelsLike: hour.hFeelsLike,
                                              hPop: hour.hPop,
                                              hTemp: hour.hTemp,
                                              hWindDeg: Int(hour.hWindDeg),
                                              hWindSpeed: hour.hWindSpeed,
                                              hWeather: [newHWeather])
                        
                        newHourlyArr.append(newH)
                    }
                }
                
                let newForecast = ForecastStub(lat: uItem.lat,
                                               lon: uItem.lon,
                                               current: [newCurrent],
                                               daily: newDailyArr.sorted(by: { $0.dTime < $1.dTime }),
                                               hourly: newHourlyArr.sorted(by: { $0.hTime < $1.hTime }))
                
                forecasts.append(newForecast)
            }
        }
        completition(forecasts)
    }
    
    func addForecastToDB(_ coord: CLLocationCoordinate2D, comletition: @escaping (ForecastModel) -> Void) {
        self.dataModel.decodeModelFromData(coord) { data in
            DataBaseManager.shared.addForecastToDB(data)
            comletition(data)
        }
    }
}
