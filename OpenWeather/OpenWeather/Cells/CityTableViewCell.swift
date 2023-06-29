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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCityNameLabel()
        setupTemperatureNowLabel()
        setupCityTimeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCityNameLabel() {
        contentView.addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        cityNameLabel.textColor = .black
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
    }
    
    private func setupTemperatureNowLabel() {
        contentView.addSubview(temperatureNowLabel)
        temperatureNowLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureNowLabel.textColor = .darkGray
        temperatureNowLabel.font = UIFont.systemFont(ofSize: 27, weight: .medium)
        NSLayoutConstraint.activate([
            temperatureNowLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            temperatureNowLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupCityTimeLabel() {
        contentView.addSubview(cityTimeLabel)
        cityTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        cityTimeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        cityTimeLabel.textColor = .lightGray
        NSLayoutConstraint.activate([
            cityTimeLabel.leadingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor),
            cityTimeLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 0)
        ])
    }
    
    func configure(city: City) {
        cityNameLabel.text = city.name
        temperatureNowLabel.text = city.weather[0].temperature + "°"
        cityTimeLabel.text = city.time
    }
}
