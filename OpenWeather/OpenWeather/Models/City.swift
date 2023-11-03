//
//  City.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import Foundation
import RealmSwift

class City: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var time: String = ""
    var weathers: [Weather] = []
    
    convenience init(json: [String: Any], name: String, weathers: [Weather]) {
        self.init()
        self.name = name
        self.weathers = weathers
        
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
}
