//
//  WeatherType.swift
//  OpenWeather
//
//  Created by nastasya on 02.11.2023.
//

import Foundation
import RealmSwift

@objc enum WeatherType: Int, RawRepresentable {
    
    case null
    case clearSky
    case fewClouds
    case scatteredClouds
    case brokenClouds
    case showerRain
    case rain
    case thunderstorm
    case snow
    case mist
    
    typealias RawValue = Int?
    
    var rawValue: RawValue {
        switch self {
            case .null:
                return nil
            case .clearSky:
                return 800
            case .fewClouds:
                return 801
            case .scatteredClouds:
                return 802
            case .brokenClouds:
                return 803
            case .showerRain:
                return 300
            case .rain:
                return 500
            case .thunderstorm:
                return 200
            case .snow:
                return 6600
            case .mist:
                return 701
        }
    }
    
    init(rawValue: RawValue) {
        switch rawValue {
            case 800:
                self = .clearSky
            case 801:
                self = .fewClouds
            case 802, 803:
                self = .scatteredClouds
            case 804:
                self = .brokenClouds
            case 300, 301, 302, 310, 311, 312, 313, 314, 321, 520, 521, 522, 531:
                self = .showerRain
            case 500, 501, 502, 503, 504:
                self = .rain
            case 200, 201, 202, 210, 211, 212, 221, 230, 231, 232:
                self = .thunderstorm
            case 511, 600, 601, 602, 611, 612, 613, 615, 616, 620, 621, 622:
                self = .snow
            case 701, 711, 721, 731, 741, 751, 761, 762, 771, 781:
                self = .mist
            default:
                self = .null
        }
    }
}
