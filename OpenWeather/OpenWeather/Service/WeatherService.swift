//
//  WeatherService.swift
//  OpenWeather
//
//  Created by nastasya on 23.08.2023.
//

import Foundation

final class WeatherService {
    static let session = URLSession(configuration: URLSessionConfiguration.default)
    
    static func loadCityWeather(city: String, resultHandler: @escaping (City) -> Void) {
        var cityWeather = City(json: [:], name: "", weather: [])
        var urlComponents = {
            var url = URLComponents()
            url.scheme = "http"
            url.host = "api.openweathermap.org"
            url.path = "/data/2.5/forecast"
            return url
        }()
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "c0cdd0113ca4184edd72a7bbe8040913")
        ]
        
        let task = session.dataTask(with: urlComponents.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(
                with: data!,
                options: JSONSerialization.ReadingOptions.mutableContainers
            )
            let array = json as! [String : Any]
            let weathersJSON = array["list"] as! NSArray
            let weather = weathersJSON.map { Weather(json: $0 as! [String: Any]) }
            cityWeather = City(json: array, name: city, weather: weather)
            resultHandler(cityWeather)
        }
        task.resume()
    }
    
    static func loadCityWeather(city: String) async throws -> City {
        var urlComponents = {
            var url = URLComponents()
            url.scheme = "http"
            url.host = "api.openweathermap.org"
            url.path = "/data/2.5/forecast"
            return url
        }()
        
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "c0cdd0113ca4184edd72a7bbe8040913")
        ]
        
        do {
            let data = try await session.data(from: urlComponents.url!)
            let json = try? JSONSerialization.jsonObject(
                with: data.0,
                options: JSONSerialization.ReadingOptions.mutableContainers
            )
            let array = json as! [String : Any]
//            print(json)
            print(array)
            if let error = array["message"] as? String {
                let cityWeather = try await loadCityWeather(city: "Westminster")
                return cityWeather
            } else {
                let weathersJSON = array["list"] as! NSArray
                let weather = weathersJSON.map { Weather(json: $0 as! [String: Any]) }
                let cityWeather = City(json: array, name: city, weather: weather)
                return cityWeather
            }
        } catch {
            let cityWeather = try await loadCityWeather(city: "Westminster")
            return cityWeather
        }
    }
}


