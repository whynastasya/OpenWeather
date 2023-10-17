//
//  CityTableViewCell.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class CityTableViewCell: UITableViewCell {

    static let identifier = "City Cell"
    
    private let cityNameLabel = UILabel()
    private let temperatureNowLabel = UILabel()
    private let cityTimeLabel = UILabel()
    private var dimensionWidth: CGFloat = 370
    private var dimensionHeight: CGFloat = 130
    private let backView = UIView()
    private let temperatureRangeLabel = UILabel()
    private let weatherTypeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        dimensionWidth = contentView.bounds.width
        dimensionHeight = contentView.bounds.height
    }
    
    private func setupView() {
        setupBackgroundView()
        setupCityNameLabel()
        setupTemperatureNowLabel()
        setupCityTimeLabel()
        setupTemperatureRangeLabel()
        setupWeatherTypeLabel()
    }
    
    private func setupBackgroundView() {
        backView.backgroundColor = .purple.withAlphaComponent(0.3)
        backView.layer.cornerRadius = dimensionWidth / 10
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalToConstant: dimensionWidth),
            backView.heightAnchor.constraint(equalToConstant: dimensionHeight),
            backView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
        let gradientLayer = GradientView.createGradientLayer(with: dimensionWidth, dimensionHeight: dimensionHeight, colors: [UIColor.systemCyan.withAlphaComponent(0.4), .systemBlue.withAlphaComponent(1)].map( { $0.cgColor}))
        gradientLayer.cornerRadius = dimensionWidth / 10
        backView.layer.addSublayer(gradientLayer)
        
    }
    
    private func setupCityNameLabel() {
        backView.addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 23, weight: .bold)
        cityNameLabel.textColor = .white
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            cityNameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupTemperatureNowLabel() {
        backView.addSubview(temperatureNowLabel)
        temperatureNowLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureNowLabel.textColor = .white
        temperatureNowLabel.font = UIFont.systemFont(ofSize: 45, weight: .medium)
        NSLayoutConstraint.activate([
            temperatureNowLabel.topAnchor.constraint(equalTo: cityNameLabel.topAnchor),
            temperatureNowLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupCityTimeLabel() {
        backView.addSubview(cityTimeLabel)
        cityTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        cityTimeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        cityTimeLabel.textColor = .white
        NSLayoutConstraint.activate([
            cityTimeLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor),
            cityTimeLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupTemperatureRangeLabel() {
        backView.addSubview(temperatureRangeLabel)
        temperatureRangeLabel.textColor = .white
        temperatureRangeLabel.text = "text text text"
        temperatureRangeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        temperatureRangeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureRangeLabel.trailingAnchor.constraint(equalTo: temperatureNowLabel.trailingAnchor),
            temperatureRangeLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -15)
        ])
    }
    
    private func setupWeatherTypeLabel() {
        backView.addSubview(weatherTypeLabel)
        weatherTypeLabel.textColor = .white
        weatherTypeLabel.text = "text text text"
        weatherTypeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        weatherTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherTypeLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor),
            weatherTypeLabel.bottomAnchor.constraint(equalTo: temperatureRangeLabel.bottomAnchor)
        ])
    }
    
    func configure(city: City) {
        cityNameLabel.text = city.name
        temperatureNowLabel.text = city.weather[0].maxTemperature + "°"
        cityTimeLabel.text = city.time
        weatherTypeLabel.text = city.weather[0].weatherType
        temperatureRangeLabel.text = "max: " + city.weather[0].maxTemperature + "°, min: "
            + city.weather[0].minTemperature + "°"
    }
}
