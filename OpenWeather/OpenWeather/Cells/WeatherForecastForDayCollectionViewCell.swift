//
//  WeatherForecastForDayCollectionViewCell.swift
//  OpenWeather
//
//  Created by nastasya on 24.10.2023.
//

import UIKit

final class WeatherForecastForDayCollectionViewCell: UICollectionViewCell {
    static let identifier = "WeatherForecastForDay"
    
    private let weekdayLabel = UILabel()
    private let weatherIconImageView = UIImageView()
    private let maxTemperatureLabel = UILabel()
    private let minTemperatureLabel = UILabel()
    private let temperatureSlider = UISlider()
    private let temperatureGradientLayer = CAGradientLayer()
    
    private var maxTemperatureForAllDays = -100.0
    private var minTemperatureForAllDays = 100.0
    private var minTemperatureForOneDay = 100.0
    private var maxTemperatureForOneDay = -100.0
    private let temperatureSliderWidth = 100.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        setupWeekdayLabel()
        setupWeatherIconImageView()
        setupMaxTemperatureLabel()
        setupTemperatureSlider()
        setupMinTemperatureLabel()
    }
    
    private func setupWeekdayLabel() {
        contentView.addSubview(weekdayLabel)
        weekdayLabel.text = "Today"
        weekdayLabel.font = .systemFont(ofSize: 16, weight: .light)
        weekdayLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weekdayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            weekdayLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0)
        ])
    }
    
    private func setupWeatherIconImageView() {
        contentView.addSubview(weatherIconImageView)
        weatherIconImageView.image = UIImage(systemName: "cloud.fill")?.withTintColor(.lightGray.withAlphaComponent(0.8), renderingMode: .alwaysOriginal)
        weatherIconImageView.contentMode = .scaleAspectFit
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherIconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            weatherIconImageView.centerYAnchor.constraint(equalTo: weekdayLabel.centerYAnchor),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 30),
            weatherIconImageView.widthAnchor.constraint(equalTo: weatherIconImageView.heightAnchor)
        ])
    }
    
    private func setupMaxTemperatureLabel() {
        contentView.addSubview(maxTemperatureLabel)
        maxTemperatureLabel.text = "5°"
        maxTemperatureLabel.font = .monospacedDigitSystemFont(ofSize: 18, weight: .medium)
        maxTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            maxTemperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            maxTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupMinTemperatureLabel() {
        contentView.addSubview(minTemperatureLabel)
        minTemperatureLabel.text = "-1°"
        minTemperatureLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        minTemperatureLabel.textColor = .darkGray
        minTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minTemperatureLabel.trailingAnchor.constraint(equalTo: temperatureSlider.leadingAnchor, constant: -10),
            minTemperatureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    private func setupTemperatureSlider() {
        contentView.addSubview(temperatureSlider)
        temperatureSlider.thumbTintColor = .clear
        temperatureSlider.minimumTrackTintColor = .lightGray.withAlphaComponent(0.3)
        temperatureSlider.maximumTrackTintColor = .lightGray.withAlphaComponent(0.3)
        temperatureSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -70),
            temperatureSlider.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            temperatureSlider.widthAnchor.constraint(equalToConstant: temperatureSliderWidth)
        ])
    }
    
    private func determineColorsForTemperatureSlider(with temperature: Double) -> CGColor {
        switch temperature {
            case -40 ... -20:
                return UIColor.blue.cgColor
            case -19 ... -10:
                return UIColor.systemBlue.cgColor
            case -9...15:
                return UIColor.systemTeal.cgColor
            case 16...26:
                return UIColor.systemYellow.cgColor
            case 27...40:
                return UIColor.systemRed.cgColor
            default:
                return UIColor.white.cgColor
        }
    }
    
    private func setupGradientLayer() {
        let colors = [determineColorsForTemperatureSlider(with: minTemperatureForOneDay), determineColorsForTemperatureSlider(with: maxTemperatureForOneDay)]
        temperatureGradientLayer.colors = colors
        temperatureGradientLayer.startPoint = .init(x: 0, y: 0.5)
        temperatureGradientLayer.endPoint = .init(x: 1, y: 0.5)
        temperatureGradientLayer.cornerRadius = 2
        let degreeWidth = temperatureSliderWidth / (maxTemperatureForAllDays - minTemperatureForAllDays)
        let xPoint = degreeWidth * minTemperatureForOneDay - degreeWidth * minTemperatureForAllDays
        let width =  degreeWidth * maxTemperatureForOneDay - xPoint - degreeWidth * minTemperatureForAllDays
        temperatureGradientLayer.frame = .init(x: xPoint, y: temperatureSlider.center.y - 3, width: width, height: 4)
        temperatureSlider.layer.insertSublayer(temperatureGradientLayer, at: 0)
    }
    
    func determineMaxAndMinTemperaturesForAllDay(with weathersForAllDays: [[Weather]]) {
        for weatherForOneDay in weathersForAllDays {
            for weather in weatherForOneDay {
                if weather.maxTemperature > maxTemperatureForAllDays {
                    maxTemperatureForAllDays = weather.maxTemperature
                }
                if weather .minTemperature < minTemperatureForAllDays {
                    minTemperatureForAllDays = weather.minTemperature
                }
            }
        }
    }
    
    private func determineMaxAndMinTemperaturesForOneDay(with weathers: [Weather]) {
        for weather in weathers {
            if weather.maxTemperature > maxTemperatureForOneDay {
                maxTemperatureForOneDay = weather.maxTemperature
            }
            if weather.minTemperature < minTemperatureForOneDay {
                minTemperatureForOneDay = weather.minTemperature
            }
        }
    }
    
    func configure(with weathers: [Weather]) {
        determineMaxAndMinTemperaturesForOneDay(with: weathers)
        weekdayLabel.text = weathers[0].weekday
        minTemperatureLabel.text = String(Int(minTemperatureForOneDay)) + "°"
        maxTemperatureLabel.text = String(Int(maxTemperatureForOneDay)) + "°"
        setupGradientLayer()
    }
}
