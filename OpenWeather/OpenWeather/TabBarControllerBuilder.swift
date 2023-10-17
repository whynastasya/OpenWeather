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
        let hometownViewController = HometownViewController()
        hometownViewController.tabBarItem.image = UIImage(systemName: "cloud.sun")
        hometownViewController.title = "Weather"
        let citiesViewController = UINavigationController(rootViewController: CitiesTableViewController())
        citiesViewController.tabBarItem.image = UIImage(systemName: "house.lodge")
        citiesViewController.title = "Cities"
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .systemBlue
        tabBarController.setViewControllers([hometownViewController, citiesViewController], animated: true)
        
        return tabBarController
    }
}
