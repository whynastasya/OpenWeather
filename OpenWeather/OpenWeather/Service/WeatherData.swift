//
//  WeatherData.swift
//  OpenWeather
//
//  Created by nastasya on 31.10.2023.
//

import Foundation
import RealmSwift

class WeatherData {
    static let shared = WeatherData()
    
    private init() {}
    
    var cityNames = [
        "Moscow",
        "Saint Petersburg",
        "Novosibirsk",
        "Yekaterinburg",
        "Nizhny Novgorod",
        "Krasnoyarsk",
        "Chelyabinsk",
        "Ufa",
        "Rostov-on-Don",
        "Krasnodar",
        "Omsk",
        "Voronezh",
        "Perm",
        "Volgograd"
    ]
    var hometownName = "Moscow"
    var cities = [City]()
    var hometown = City()
    
    func getWeathersData() {
        for cityName in cityNames {
            Task {
                let city = try await WeatherService.loadCityWeather(city: cityName)
                cities.append(city)
            }
        }
        Task {
            hometown = try await WeatherService.loadCityWeather(city: hometownName)
        }
    }
}
