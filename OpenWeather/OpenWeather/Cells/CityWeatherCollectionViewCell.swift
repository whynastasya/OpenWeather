//
//  CityWeatherCollectionViewCell.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class CityWeatherCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Weather Cell"
    
    private let weatherImageView = UIImageView()
    private let dateLabel = UILabel()
    private let temperatureLabel = UILabel()
    private
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupWeatherImageView()
        setupDateLabel()
        setupTemperatureLabel()
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupWeatherImageView() {
        contentView.addSubview(weatherImageView)
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            weatherImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            weatherImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            weatherImageView.heightAnchor.constraint(equalToConstant: 60),
            weatherImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func createWeatherImage(with weatherType: WeatherType) {
        switch weatherType {
            case .cloudy:
                let configuration = UIImage.SymbolConfiguration(paletteColors: [.lightGray.withAlphaComponent(0.5), .systemYellow])
                weatherImageView.image = UIImage(systemName: "cloud.sun.fill")?.withConfiguration(configuration)
            case .murky:
                let configuration = UIImage.SymbolConfiguration(hierarchicalColor: .lightGray.withAlphaComponent(0.5))
                weatherImageView.image = UIImage(systemName: "smoke.fill")?.withConfiguration(configuration)
            case .rain:
                let configuration = UIImage.SymbolConfiguration(paletteColors: [.lightGray.withAlphaComponent(0.5), .systemBlue.withAlphaComponent(0.5)])
                weatherImageView.image = UIImage(systemName: "cloud.rain.fill")?.withConfiguration(configuration)
            case .sunny:
                weatherImageView.image = UIImage(systemName: "sun.max.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
            case .thunderstorm:
                let configuration = UIImage.SymbolConfiguration(paletteColors: [.lightGray.withAlphaComponent(0.5), .systemBlue.withAlphaComponent(0.5), .systemYellow])
                weatherImageView.image = UIImage(systemName: "cloud.bolt.rain.fill")?.withConfiguration(configuration)
        }
    }
    
    private func setupDateLabel() {
        contentView.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        dateLabel.textColor = .black.withAlphaComponent(0.9)
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: weatherImageView.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
    }
    
    private func setupTemperatureLabel() {
        contentView.addSubview(temperatureLabel)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        temperatureLabel.textColor = .black
        NSLayoutConstraint.activate([
            temperatureLabel.bottomAnchor.constraint(equalTo: weatherImageView.bottomAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5)
        ])
    }
    
    private func defineBackgfoundColor(with temperature: Int) {
        switch temperature {
            case 0...15:
                backgroundColor = .systemGreen.withAlphaComponent(0.1)
                layer.borderColor = UIColor.systemGreen.cgColor
            case 16...25:
                backgroundColor = .systemYellow.withAlphaComponent(0.15)
                layer.borderColor = UIColor.systemYellow.cgColor
            case 26...32:
                backgroundColor = .systemOrange.withAlphaComponent(0.15)
                layer.borderColor = UIColor.systemOrange.cgColor
            default:
                return
        }
    }
    
    func configure(weather: Weather) {
        createWeatherImage(with: weather.weatherType)
        dateLabel.text = weather.date
        temperatureLabel.text = weather.temperature + "°"
        defineBackgfoundColor(with: Int(weather.temperature) ?? 0)
    }
}
