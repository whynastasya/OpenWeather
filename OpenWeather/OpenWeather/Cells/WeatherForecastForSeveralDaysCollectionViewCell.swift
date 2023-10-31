//
//  WeatherForecastForSeveralDaysCollectionViewCell.swift
//  OpenWeather
//
//  Created by nastasya on 30.10.2023.
//

import UIKit

final class WeatherForecastForSeveralDaysCollectionViewCell: UICollectionViewCell {
    static let identifier = "WeatherForecastForSeveralDays"
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var weathers = [[Weather]]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        print(weathers)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: contentView.bounds.width, height: 40)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        flowLayout.headerReferenceSize = CGSize(width: contentView.bounds.width, height: 30)
        collectionView.collectionViewLayout = flowLayout
        
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .white.withAlphaComponent(0.6)
        collectionView.layer.cornerRadius = 20
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeatherForecastForDayCollectionViewCell.self, forCellWithReuseIdentifier: WeatherForecastForDayCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
}

extension WeatherForecastForSeveralDaysCollectionViewCell: UICollectionViewDelegate {
    
}

extension WeatherForecastForSeveralDaysCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        weathers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherForecastForDayCollectionViewCell.identifier, for: indexPath) as! WeatherForecastForDayCollectionViewCell
        cell.determineMaxAndMinTemperaturesForAllDay(with: weathers)
        cell.configure(with: weathers[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionViewCell.identifier, for: indexPath) as! HeaderCollectionViewCell
        headerView.configure(text: "Weather forecast for \(weathers.count) days")
        return headerView
    }
}
