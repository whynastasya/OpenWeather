//
//  City.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import Foundation
import RealmSwift

class City {
    var name: String = ""
    var time: String = ""
    var weathers: [Weather] = [Weather]()
    
    init(json: [String: Any], name: String, weather: [Weather]) {
        self.name = name
        self.weathers = weather
        
        if let cityJSON = json["city"] as? [String: Any] {
            if let timezoneJSON = cityJSON["timezone"] as? Int {
                let timeFormatter = DateFormatter()
                timeFormatter.timeZone = TimeZone(secondsFromGMT: timezoneJSON)
                timeFormatter.timeStyle = .short
                let time = timeFormatter.string(from: Date())
                self.time = time
            }
        }
    }
    
    init(name: String, time: String) {
        self.name = name
        self.time = time
        self.weathers = [Weather](repeating: Weather(), count: 10)
    }
}
