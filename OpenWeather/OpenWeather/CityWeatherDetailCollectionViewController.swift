//
//  HometownViewController.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class CityWeatherDetailCollectionViewController: UICollectionViewController {
    
    private let gradientView = GradientCirclesView(frame: .zero,
                                            colors: [UIColor.white.cgColor,
                                                     UIColor.systemBlue.withAlphaComponent(0.5).cgColor,
                                                     UIColor.systemPurple.withAlphaComponent(0.7).cgColor])
    var city = WeatherData.shared.hometown
    private var filteredWeathers = [[Weather]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(makeHometown))
        navigationController?.navigationBar.tintColor = .systemPurple
    }
    
    private func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 2
        flowLayout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = flowLayout
        collectionView.backgroundView = gradientView
        collectionView.register(
            MainInformationAboutCityWeatherCollectionCell.self,
            forCellWithReuseIdentifier: MainInformationAboutCityWeatherCollectionCell.identifier
        )
        collectionView.register(HourlyWeatherForecastCollectionViewCell.self, forCellWithReuseIdentifier: HourlyWeatherForecastCollectionViewCell.identifier)
        collectionView.register(WeatherForecastForSeveralDaysCollectionViewCell.self, forCellWithReuseIdentifier: WeatherForecastForSeveralDaysCollectionViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    private func filterWeatherByWeekdays() {
        var weatherForOneDay = [Weather()]
        for weather in city.weathers {
            if weather.date == weatherForOneDay[0].date {
                weatherForOneDay.append(weather)
            } else {
                filteredWeathers.append(weatherForOneDay)
                weatherForOneDay = [weather]
            }
        }
        filteredWeathers.remove(at: 0)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        switch indexPath.item {
            case 0:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MainInformationAboutCityWeatherCollectionCell.identifier,
                    for: indexPath
                ) as! MainInformationAboutCityWeatherCollectionCell
                cell.configure(city: city)
                return cell
            case 1:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HourlyWeatherForecastCollectionViewCell.identifier,
                    for: indexPath
                ) as! HourlyWeatherForecastCollectionViewCell
                cell.weathers = city.weathers
                return cell
            case 2:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherForecastForSeveralDaysCollectionViewCell.identifier, for: indexPath) as! WeatherForecastForSeveralDaysCollectionViewCell
                filterWeatherByWeekdays()
                cell.weathers = filteredWeathers
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: "Cell",
                    for: indexPath
                )
                cell.backgroundColor = .systemPink
                return cell
        }
    }
    
    @objc func makeHometown() {
        let alertController = UIAlertController(title: "Make this city your hometown?", message: "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {_ in
            WeatherData.shared.hometown = self.city
            WeatherData.shared.hometownName = self.city.name
            let tabBarController = TabBarControllerBuilder.createTabBarController()
            tabBarController.modalPresentationStyle = .fullScreen
            self.present(tabBarController, animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "No", style: .default))
        present(alertController, animated: true)
    }
}

extension CityWeatherDetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        let width = view.bounds.width
        let height : CGFloat
        switch indexPath.item {
            case 0:
                height = 270
            case 1:
                height = 140
            case 2:
                height = 280
            default:
                height = 50
        }
        return CGSizeMake(width, height)
    }
}

