//
//  HometownViewController.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class CityDetailCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.register(
            MainInformationAboutCityWeatherCollectionCell.self,
            forCellWithReuseIdentifier: MainInformationAboutCityWeatherCollectionCell.identifier
        )
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MainInformationAboutCityWeatherCollectionCell.identifier,
            for: indexPath
        ) as! MainInformationAboutCityWeatherCollectionCell
        cell.backgroundColor = .blue
        return cell
    }
}

extension CityDetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        let width : CGFloat
        let height : CGFloat
        if indexPath.item == 0 {
            width = 100
            height = 100
        } else {
            width = 50
            height = 50
        }
        return CGSizeMake(width, height)
    }
}
