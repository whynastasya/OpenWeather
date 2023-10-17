//
//  Weather.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import Foundation

struct Weather {
    var date: String = ""
    var time: String = ""
    var weekday: String = ""
    var maxTemperature: String = ""
    var minTemperature: String = ""
    var weatherIcon: String = ""
    var weatherType: String = ""
    
    init(json: [String: Any]) {
        let dt  = json["dt_txt"] as! String
        
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTime = dateTimeFormatter.date(from: dt)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.string(from: dateTime!)
        self.date = date
        
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        let time = timeFormatter.string(from: dateTime!)
        self.time = time
        
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.dateFormat = "EE"
        let weekday = weekdayFormatter.string(from: dateTime!)
        self.weekday = weekday
        
        if let main = json["main"] as? [String: Any] {
            let maxTemp = main["temp_max"] as! NSNumber
            self.maxTemperature = String(Int(truncating: maxTemp))
            
            let minTemp = main["temp_min"] as! NSNumber
            self.minTemperature = String(Int(truncating: minTemp))
        }
        
        if let weatherJSON = json["weather"] as? NSArray {
            if let weather = weatherJSON[0] as? [String: Any] {
                self.weatherIcon = weather["icon"] as! String
                self.weatherType = weather["description"] as! String
            }
        }
    }
}
