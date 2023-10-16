//
//  CityWeatherViewController.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class CityWeatherCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: view.bounds.width / 3 - 2, height: view.bounds.width / 3 - 30)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        collectionView.collectionViewLayout = flowLayout
        collectionView.register(CityWeatherCollectionViewCell.self, forCellWithReuseIdentifier: CityWeatherCollectionViewCell.identifier)
        collectionView.register(HeaderWeatherCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
    }
    
    private func setupNavigationBar() {
//        navigationItem.title = city.name
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        city.weather.count
        12
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityWeatherCollectionViewCell.identifier, for: indexPath) as! CityWeatherCollectionViewCell
//        cell.configure(weather: city.weather[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as! HeaderWeatherCollectionReusableView
        header.frame = CGRectMake(0, 0, 100, 100)
        header.backgroundColor = .black
        return header
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width: view.frame.size.width, height: 200)
    }

}

