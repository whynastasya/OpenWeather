//
//  WeatherForecastForOneHourCollectionViewCell.swift
//  OpenWeather
//
//  Created by nastasya on 24.10.2023.
//

import UIKit

final class WeatherForecastForOneHourCollectionViewCell: UICollectionViewCell {
    static let identifier = "WeatherForecastForOneHourCell"
    private let hourLabel = UILabel()
    private let weatherIconImageView = UIImageView()
    private let temperatureLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        setupHourLabel()
        setupWeatherIcon()
        setupTemperatureLabel()
        setupConstraints()
    }
    
    private func setupHourLabel() {
        contentView.addSubview(hourLabel)
        hourLabel.text = "Now"
        hourLabel.font = .systemFont(ofSize: 14, weight: .light)
        hourLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupWeatherIcon() {
        contentView.addSubview(weatherIconImageView)
        weatherIconImageView.image = UIImage(systemName: "cloud.fill")?.withTintColor(.lightGray.withAlphaComponent(0.8), renderingMode: .alwaysOriginal)
        weatherIconImageView.contentMode = .scaleAspectFit
        weatherIconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTemperatureLabel() {
        contentView.addSubview(temperatureLabel)
        temperatureLabel.text = "5°"
        temperatureLabel.font = .systemFont(ofSize: 17, weight: .regular)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            hourLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            hourLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            weatherIconImageView.centerXAnchor.constraint(equalTo: hourLabel.centerXAnchor),
            weatherIconImageView.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 5),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 25),
            weatherIconImageView.widthAnchor.constraint(equalTo: weatherIconImageView.heightAnchor),
            
            temperatureLabel.centerXAnchor.constraint(equalTo: hourLabel.centerXAnchor),
            temperatureLabel.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 5)
        ])
    }
    
    func configure(nearestWeather: Weather) {
        hourLabel.text = nearestWeather.time
        weatherIconImageView.image = WeatherIcon.createWeatherIcon(weatherType: nearestWeather.weatherType)
        temperatureLabel.text = String(Int(nearestWeather.maxTemperature)) + "°"
    }
}
