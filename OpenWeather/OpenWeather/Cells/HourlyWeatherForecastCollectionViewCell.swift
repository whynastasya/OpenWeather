//
//  WeatherForecastCollectionViewCell.swift
//  OpenWeather
//
//  Created by nastasya on 26.10.2023.
//

import UIKit

final class HourlyWeatherForecastCollectionViewCell: UICollectionViewCell {
    static let identifier = "HourlyWeatherForecast"
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var weathers = [Weather]()
    private let countCells = 6
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: contentView.bounds.width / Double(countCells) - 10, height: contentView.bounds.width / Double(countCells))
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        flowLayout.headerReferenceSize = CGSize(width: contentView.bounds.width, height: 30)
        collectionView.collectionViewLayout = flowLayout
        
        contentView.addSubview(collectionView)
        collectionView.layer.cornerRadius = 20
        collectionView.backgroundColor = .white.withAlphaComponent(0.6)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            WeatherForecastForOneHourCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherForecastForOneHourCollectionViewCell.identifier
        )
        collectionView.register(
            HeaderCollectionViewCell.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionViewCell.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}

extension HourlyWeatherForecastCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        countCells
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WeatherForecastForOneHourCollectionViewCell.identifier,
            for: indexPath
        ) as! WeatherForecastForOneHourCollectionViewCell
        cell.configure(nearestWeather: weathers[indexPath.row])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderCollectionViewCell.identifier,
            for: indexPath
        ) as! HeaderCollectionViewCell
        headerView.configure(text: "Hourly weather forecast")
        return headerView
    }
}

extension HourlyWeatherForecastCollectionViewCell:  UICollectionViewDelegate {
    
}

