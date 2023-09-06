//
//  WeatherService.swift
//  OpenWeather
//
//  Created by nastasya on 23.08.2023.
//

import Foundation

class WeatherService {
    static let session = URLSession(configuration: URLSessionConfiguration.default)
    static var url = {
        var url = URLComponents()
        url.scheme = "http"
        url.host = "api.openweathermap.org"
        url.path = "/data/2.5/weather"
        return url
    }()
    
    static func loadCityWeather(city: String) {
        url.queryItems = [
            URLQueryItem(name: "q", value: "Moscow"),
            URLQueryItem(name: "appid", value: "c0cdd0113ca4184edd72a7bbe8040913")
        ]
        
        let task = session.dataTask(with: url.url!) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
            print(json)
        }
        task.resume()
    }
    
    static func loadCityWeather() async {
        do {
            try await session.data(from: url.url!)
        } catch {
            print()
        }
    }
}
