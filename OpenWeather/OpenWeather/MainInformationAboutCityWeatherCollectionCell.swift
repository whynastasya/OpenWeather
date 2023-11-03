//
//  MainInformationAboutCityWeatherCollectionCell.swift
//  OpenWeather
//
//  Created by nastasya on 17.10.2023.
//

import Foundation
import UIKit

final class MainInformationAboutCityWeatherCollectionCell: UICollectionViewCell {
    static let identifier = "MainInformation"
    
    private let cityNameLabel = UILabel()
    private let temperatureNowLabel = UILabel()
    private let weatherTypeLabel = UILabel()
    private let temperatureRangeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentView() {
        setupCityNameLabel()
        setupTemperatureNowLabel()
        setupWeatherTypeLabel()
        setupTemperatureRangeLabel()
    }
    
    private func setupCityNameLabel() {
        contentView.addSubview(cityNameLabel)
        cityNameLabel.text = "Moscow"
        cityNameLabel.font = .systemFont(ofSize: 40, weight: .light)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50)
        ])
    }
    
    private func setupTemperatureNowLabel() {
        contentView.addSubview(temperatureNowLabel)
        temperatureNowLabel.text = "4°"
        temperatureNowLabel.font = .systemFont(ofSize: 80, weight: .ultraLight)
        temperatureNowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureNowLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            temperatureNowLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupWeatherTypeLabel() {
        contentView.addSubview(weatherTypeLabel)
        weatherTypeLabel.text = "Cloudly"
        weatherTypeLabel.font = .systemFont(ofSize: 20, weight: .light)
        weatherTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherTypeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            weatherTypeLabel.topAnchor.constraint(equalTo: temperatureNowLabel.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupTemperatureRangeLabel() {
        contentView.addSubview(temperatureRangeLabel)
        temperatureRangeLabel.text = "Min: 8°, max: 5°"
        temperatureRangeLabel.font = .systemFont(ofSize: 20, weight: .light)
        temperatureRangeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureRangeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            temperatureRangeLabel.topAnchor.constraint(equalTo: weatherTypeLabel.bottomAnchor, constant: 0)
        ])
    }
    
    func configure(city: City) {
        cityNameLabel.text = city.name
        temperatureNowLabel.text = String(Int(city.weathers[0].maxTemperature)) + "°"
        weatherTypeLabel.text = city.weathers[0].weatherDescription
        temperatureRangeLabel.text = "max: " + String(Int(city.weathers[0].maxTemperature)) + "°, min: "
            + String(Int(city.weathers[0].minTemperature)) + "°"
    }
}
