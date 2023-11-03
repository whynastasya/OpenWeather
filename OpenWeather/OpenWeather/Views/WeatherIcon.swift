//
//  WeatherIcon.swift
//  OpenWeather
//
//  Created by nastasya on 03.11.2023.
//

import Foundation
import UIKit

class WeatherIcon {
    static func createWeatherIcon(weatherType: WeatherType) -> UIImage {
        let yellow = UIColor.systemYellow.withAlphaComponent(0.7)
        let gray = UIColor.lightGray.withAlphaComponent(0.6)
        let white = UIColor.white.withAlphaComponent(0.7)
        let blue = UIColor.blue.withAlphaComponent(0.6)
        let orange = UIColor.systemOrange.withAlphaComponent(0.7)
        switch weatherType {
            case .clearSky:
                return UIImage(systemName: "sun.max.fill")!.withTintColor(yellow, renderingMode: .alwaysOriginal)
            case .fewClouds:
                return UIImage(systemName: "cloud.sun.fill")!.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [gray, yellow]))
            case .scatteredClouds:
                return UIImage(systemName: "cloud.fill")!.withTintColor(gray, renderingMode: .alwaysOriginal)
            case .brokenClouds:
                return UIImage(systemName: "cloud.fill")!.withTintColor(gray, renderingMode: .alwaysOriginal)
            case .showerRain:
                return UIImage(systemName: "cloud.rain.fill")!.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [gray, blue]))
            case .rain:
                return UIImage(systemName: "cloud.sun.rain.fill")!.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [gray, yellow, blue]))
            case .thunderstorm:
                return UIImage(systemName: "cloud.bolt.rain.fill")!.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [gray, orange]))
            case .snow:
                return UIImage(systemName: "sun.snow.fill")!.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [white, gray]))
            case .mist:
                return UIImage(systemName: "cloud.fog.fill")!.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [white, gray]))
            default:
                return UIImage(systemName: "sun.max.trianglebadge.exclamationmark")!.withTintColor(.black, renderingMode: .alwaysOriginal)
        }
    }
}
