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
    
    private let backView = UIView()
    private let cityNameLabel = UILabel()
    private let temperatureNowLabel = UILabel()
    private let weatherTypeLabel = UILabel()
    private let temperatureRangeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContentViewCell() {
        setupBackView()
    }
    
    private func setupBackView() {
        
    }
    
    private func setupCityNameLabel() {
        
    }
    
    private func setupTemperatureNowLabel() {
        
    }
    
    private func setupWeatherTypeLabel() {
        
    }
    
    private func setupTemperatureRangeLabel() {
        
    }
    
    func configure(city: City) {
        
    }
}
