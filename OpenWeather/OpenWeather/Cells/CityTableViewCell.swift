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
        setupConstraints()
    }
    
    private func setupBackgroundView() {
        backView.layer.cornerRadius = dimensionWidth / 10
        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        let gradientLayer = GradientLayer.createGradientLayer(with: CGRectMake(0, 0, dimensionWidth, dimensionHeight), colors: [UIColor.systemBlue.withAlphaComponent(0.6), .systemPurple.withAlphaComponent(0.8)].map( { $0.cgColor}))
        gradientLayer.cornerRadius = dimensionWidth / 10
        backView.layer.addSublayer(gradientLayer)
        
    }
    
    private func setupCityNameLabel() {
        backView.addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 28, weight: .light)
        cityNameLabel.textColor = .white
    }
    
    private func setupTemperatureNowLabel() {
        backView.addSubview(temperatureNowLabel)
        temperatureNowLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureNowLabel.textColor = .white
        temperatureNowLabel.font = UIFont.systemFont(ofSize: 55, weight: .light)
    }
    
    private func setupCityTimeLabel() {
        backView.addSubview(cityTimeLabel)
        cityTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        cityTimeLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        cityTimeLabel.textColor = .white
    }
    
    private func setupTemperatureRangeLabel() {
        backView.addSubview(temperatureRangeLabel)
        temperatureRangeLabel.textColor = .white
        temperatureRangeLabel.text = "text text text"
        temperatureRangeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        temperatureRangeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupWeatherTypeLabel() {
        backView.addSubview(weatherTypeLabel)
        weatherTypeLabel.textColor = .white
        weatherTypeLabel.text = "text text text"
        weatherTypeLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        weatherTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            weatherTypeLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor),
            weatherTypeLabel.bottomAnchor.constraint(equalTo: temperatureRangeLabel.bottomAnchor)
        ])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalToConstant: dimensionWidth),
            backView.heightAnchor.constraint(equalToConstant: dimensionHeight),
            backView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            cityNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            cityNameLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 25),
            
            temperatureNowLabel.topAnchor.constraint(equalTo: cityNameLabel.topAnchor),
            temperatureNowLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            
            cityTimeLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor),
            cityTimeLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 0),
            
            temperatureRangeLabel.trailingAnchor.constraint(equalTo: temperatureNowLabel.trailingAnchor),
            temperatureRangeLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -15)
        ])
    }
    
    func configure(city: City) {
        cityNameLabel.text = city.name
        temperatureNowLabel.text = String(Int(city.weathers[0].maxTemperature)) + "°"
        cityTimeLabel.text = city.time
        weatherTypeLabel.text = city.weathers[0].weatherDescription
        temperatureRangeLabel.text = "max: " + String(Int(city.weathers[0].maxTemperature)) + "°, min: "
            + String(Int(city.weathers[0].minTemperature)) + "°"
    }
}
