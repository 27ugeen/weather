//
//  ForecastModel.swift
//  Weather
//
//  Created by GiN Eugene on 1/7/2022.
//

import Foundation
import Alamofire
import CoreLocation

enum WeatherURLs: String {
    case daily = "https://api.openweathermap.org/data/3.0/onecall?units=metric&appid="
    case geo = "http://api.openweathermap.org/geo/1.0/direct?limit=1&appid="
    case city = "http://api.openweathermap.org/geo/1.0/reverse?limit=1&appid="
}

struct ForecastModel: Decodable {
    var city: String = ""
    var country: String = ""
    
    let daily: [Daily]
    let hourly: [Hourly]
    let lat: Double
    let lon: Double
    
    enum CodingKeys: String, CodingKey {
        case daily
        case hourly
        case lat
        case lon
        
        case current
    }
    //1======current==========
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
    let weather: [Weather]
    
    enum CurrentCodingKeys: String, CodingKey {
        case currentTime = "dt"
        case sunrise
        case sunset
        case temp
        case feelsLike = "feels_like"
        case humidity
        case uvi
        case clouds
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        daily = try container.decode([Daily].self, forKey: .daily)
        hourly = try container.decode([Hourly].self, forKey: .hourly)
        lat = try container.decode(Double.self, forKey: .lat)
        lon = try container.decode(Double.self, forKey: .lon)
        //1=====================current===========================
        let cContainer = try container.nestedContainer(keyedBy: CurrentCodingKeys.self, forKey: .current)
        currentTime = try cContainer.decode(Int.self, forKey: .currentTime)
        sunrise = try cContainer.decode(Int.self, forKey: .sunrise)
        sunset = try cContainer.decode(Int.self, forKey: .sunset)
        temp = try cContainer.decode(Double.self, forKey: .temp)
        feelsLike = try cContainer.decode(Double.self, forKey: .feelsLike)
        humidity = try cContainer.decode(Int.self, forKey: .humidity)
        uvi = try cContainer.decode(Double.self, forKey: .uvi)
        clouds = try cContainer.decode(Int.self, forKey: .clouds)
        windSpeed = try cContainer.decode(Double.self, forKey: .windSpeed)
        windDeg = try cContainer.decode(Int.self, forKey: .windDeg)
        weather = try cContainer.decode([Weather].self, forKey: .weather)
    }
}

struct Weather: Decodable {
    let descript: String
    
    enum CodingKeys: String, CodingKey {
        case descript = "description"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        descript = try container.decode(String.self, forKey: .descript)
    }
}

struct Daily: Decodable {
    let dClouds: Int
    let dTime: Int
    let dMoonPhase: Double
    let dMoonrise: Int
    let dMoonset: Int
    let dSunrise: Int
    let dSunset: Int
    let dPop: Double
    let dUVI: Double
    let dWeather: [Weather]
    let dWindDeg: Int
    let dWindSpeed: Double
    
    
    enum CodingKeys: String, CodingKey {
        case dClouds = "clouds"
        case dTime = "dt"
        case dMoonPhase = "moon_phase"
        case dMoonrise = "moonrise"
        case dMoonset = "moonset"
        case dSunrise = "sunrise"
        case dSunset = "sunset"
        case dPop = "pop"
        case dUVI = "uvi"
        case dWeather = "weather"
        case dWindDeg = "wind_deg"
        case dWindSpeed = "wind_speed"
        
        case dFeelsLike = "feels_like"
        case dTemp = "temp"
    }
    
    let dFeelsTemp: Double
    let nFeelsTemp: Double
    
    enum FeelsLikeCodingKeys: String, CodingKey {
        case dFeelsTemp = "day"
        case nFeelsTemp = "night"
    }
    
    let dTempDay: Double
    let dTempMax: Double
    let dTempMin: Double
    let dTempNight: Double
    
    enum TemperatureCodingKeys: String, CodingKey {
        case dTempDay = "day"
        case dTempMax = "max"
        case dTempMin = "min"
        case dTempNight = "night"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dClouds = try container.decode(Int.self, forKey: .dClouds)
        dTime = try container.decode(Int.self, forKey: .dTime)
        dMoonPhase = try container.decode(Double.self, forKey: .dMoonPhase)
        dMoonrise = try container.decode(Int.self, forKey: .dMoonrise)
        dMoonset = try container.decode(Int.self, forKey: .dMoonset)
        dSunrise = try container.decode(Int.self, forKey: .dSunrise)
        dSunset = try container.decode(Int.self, forKey: .dSunset)
        dPop = try container.decode(Double.self, forKey: .dPop)
        dUVI = try container.decode(Double.self, forKey: .dUVI)
        dWeather = try container.decode([Weather].self, forKey: .dWeather)
        dWindDeg = try container.decode(Int.self, forKey: .dWindDeg)
        dWindSpeed = try container.decode(Double.self, forKey: .dWindSpeed)
        
        let feelsContainer = try container.nestedContainer(keyedBy: FeelsLikeCodingKeys.self, forKey: .dFeelsLike)
        dFeelsTemp = try feelsContainer.decode(Double.self, forKey: .dFeelsTemp)
        nFeelsTemp = try feelsContainer.decode(Double.self, forKey: .nFeelsTemp)
        
        let tempContainer = try container.nestedContainer(keyedBy: TemperatureCodingKeys.self, forKey: .dTemp)
        dTempDay = try tempContainer.decode(Double.self, forKey: .dTempDay)
        dTempNight = try tempContainer.decode(Double.self, forKey: .dTempNight)
        dTempMax = try tempContainer.decode(Double.self, forKey: .dTempMax)
        dTempMin = try tempContainer.decode(Double.self, forKey: .dTempMin)
    }
}

struct Hourly: Decodable {
    let hClouds: Int
    let hTime: Int
    let hFeelsLike: Double
    let hPop: Double
    let hTemp: Double
    let hWindDeg: Int
    let hWindSpeed: Double
    let hWeather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case hClouds = "clouds"
        case hTime = "dt"
        case hFeelsLike = "feels_like"
        case hPop = "pop"
        case hTemp = "temp"
        case hWindDeg = "wind_deg"
        case hWindSpeed = "wind_speed"
        case hWeather = "weather"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        hClouds = try container.decode(Int.self, forKey: .hClouds)
        hTime = try container.decode(Int.self, forKey: .hTime)
        hFeelsLike = try container.decode(Double.self, forKey: .hFeelsLike)
        hPop = try container.decode(Double.self, forKey: .hPop)
        hTemp = try container.decode(Double.self, forKey: .hTemp)
        hWindDeg = try container.decode(Int.self, forKey: .hWindDeg)
        hWindSpeed = try container.decode(Double.self, forKey: .hWindSpeed)
        hWeather = try container.decode([Weather].self, forKey: .hWeather)
    }
}

struct CoordinateCityModel: Decodable {
    let country: String
    let name: String
    let lat: Double
    let lon: Double
}

struct NameCityModel: Decodable {
    let country: String
    let name: String
}

class ForecastViewModel {
    
    private var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
                fatalError("Couldn't find file 'Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'Info.plist'.")
            }
            return value
        }
    }
    
    var currentWeather: ForecastModel?
    var currentWeatherCoordinate: String = ""
    
    func createURLForCurrentWeather(_ coordinate: CLLocationCoordinate2D) -> String {
        let headRL = WeatherURLs.daily.rawValue
        let coordinateParams = "&lat=\(coordinate.latitude)&lon=\(coordinate.longitude)"
        let resultURL = headRL + apiKey + coordinateParams
        return resultURL
    }
    
    func decodeModelFromData(completition: @escaping (ForecastModel) -> Void) {
        if let url = URL(string: currentWeatherCoordinate) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let request = AF.request(url)
            
            request.validate().responseDecodable(of: ForecastModel.self, decoder: decoder) { data in
                if let uValue = data.value {
                    completition(uValue)
                    print("All: \(String(describing: uValue))")
//                    print("Weather descript: \(String(describing: uValue.weather[0].descript))")
                }
            }
        }
    }
    
    func createURLForGeo(_ name: String) -> String {
        let headRL = WeatherURLs.geo.rawValue
        let coordinateParams = "&q=\(name)"
        let resultURL = headRL + apiKey + coordinateParams
        return resultURL
    }
    
    func takeLocFromName(_ name: String, completition: @escaping (CoordinateCityModel) -> Void) {
        let cUrl = self.createURLForGeo(name)
        
        if let url = URL(string: cUrl) {
            let decoder = JSONDecoder()
            
            let request = AF.request(url)
            
            request.validate().responseDecodable(of: [CoordinateCityModel].self, decoder: decoder) { data in
                
                if let uValue = data.value {
                    if uValue.isEmpty {
                        print("No such city found")
                        return
                    }
                    
                    self.currentWeatherCoordinate = self.createURLForCurrentWeather(CLLocationCoordinate2D(latitude: uValue[0].lat, longitude: uValue[0].lon))
                    completition(uValue.first!)
                    print(uValue.first!)
                }
            }
        }
    }
    
    func createURLForCity(_ coord: CLLocationCoordinate2D) -> String {
        let headRL = WeatherURLs.city.rawValue
        let coordinateParams = "&lat=\(coord.latitude)&lon=\(coord.longitude)"
        let resultURL = headRL + apiKey + coordinateParams
        return resultURL
    }
    
    func takeCityFromLoc(_ coord: CLLocationCoordinate2D, completition: @escaping (NameCityModel) -> Void) {
        let cUrl = self.createURLForCity(CLLocationCoordinate2D(latitude: coord.latitude, longitude: coord.longitude))
        
        if let url = URL(string: cUrl) {
            let decoder = JSONDecoder()
            let request = AF.request(url)
            
            request.validate().responseDecodable(of: [NameCityModel].self, decoder: decoder) { data in
                if let uValue = data.value {
                    completition(uValue.first!)
                    print(uValue.first!)
                }
            }
        }
    }
}
