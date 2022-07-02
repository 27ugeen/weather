//
//  ForecastModel.swift
//  Weather
//
//  Created by GiN Eugene on 1/7/2022.
//

import Foundation
import Alamofire

enum WeatherURLs: String {
    case current = "https://api.openweathermap.org/data/2.5/weather?lat=47.09608&lon=37.54817&appid=205e68368240d2136c5ca99aaf88ec20&units=metric"
}

struct ForecastModel: Decodable {
    let id: Int
    let city: String
    let currentTime: Int
    let weather: [Weather]
    
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
    
    let cloudiness: Int
    
    let country: String
    let sunrise: Int
    let sunset: Int
    
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case city = "name"
        case currentTime = "dt"
        case weather
        
        case main
        case clouds
        case sysInfo = "sys"
        case wind
    }
    
    enum MainCodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
    
    enum CloudsCodingKeys: String, CodingKey {
        case cloudiness = "all"
    }
    
    enum SysInfoCodingKeys: String, CodingKey {
        case country
        case sunrise
        case sunset
    }
    
    enum WindCodingKeys: String, CodingKey {
        case windSpeed = "speed"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        city = try container.decode(String.self, forKey: .city)
        currentTime = try container.decode(Int.self, forKey: .currentTime)
        weather = try container.decode([Weather].self, forKey: .weather)
        //==================================================
        let mainContainer = try container.nestedContainer(keyedBy: MainCodingKeys.self, forKey: .main)
        temp = try mainContainer.decode(Double.self, forKey: .temp)
        feelsLike = try mainContainer.decode(Double.self, forKey: .feelsLike)
        tempMin = try mainContainer.decode(Double.self, forKey: .tempMin)
        tempMax = try mainContainer.decode(Double.self, forKey: .tempMax)
        humidity = try mainContainer.decode(Int.self, forKey: .humidity)
        //==================================================
        let cloudsContainer = try container.nestedContainer(keyedBy: CloudsCodingKeys.self, forKey: .clouds)
        cloudiness = try cloudsContainer.decode(Int.self, forKey: .cloudiness)
        //==================================================
        let sysInfoContainer = try container.nestedContainer(keyedBy: SysInfoCodingKeys.self, forKey: .sysInfo)
        country = try sysInfoContainer.decode(String.self, forKey: .country)
        sunrise = try sysInfoContainer.decode(Int.self, forKey: .sunrise)
        sunset = try sysInfoContainer.decode(Int.self, forKey: .sunset)
        //==================================================
        let windContainer = try container.nestedContainer(keyedBy: WindCodingKeys.self, forKey: .wind)
        windSpeed = try windContainer.decode(Double.self, forKey: .windSpeed)
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

class ForecastViewModel {
    
    var currentWeather: ForecastModel?
    
    func decodeModelFromData(completition: @escaping (ForecastModel) -> Void) {
        if let url = URL(string: WeatherURLs.current.rawValue) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let request = AF.request(url)
            
            request.validate().responseDecodable(of: ForecastModel.self, decoder: decoder) { data in
                if let uValue = data.value {
                    completition(uValue)
                    
                    print("All: \(String(describing: uValue))")
                    print("Weather descript: \(String(describing: uValue.weather[0].descript))")
                }
            }
        }
    }
}

