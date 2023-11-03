//
//  TabBarController.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import Foundation
import UIKit

final class TabBarControllerBuilder {
    static func createTabBarController() -> UITabBarController {
        let hometownViewController = CityWeatherDetailCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        hometownViewController.tabBarItem.image = UIImage(systemName: "cloud.sun")
        hometownViewController.title = "Hometown"
        let citiesViewController = UINavigationController(rootViewController: CitiesTableViewController())
        citiesViewController.tabBarItem.image = UIImage(systemName: "house.lodge")
        citiesViewController.title = "Cities"
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .systemPurple
        tabBarController.setViewControllers([hometownViewController, citiesViewController], animated: true)
        
        return tabBarController
    }
}
