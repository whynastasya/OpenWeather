//
//  CitiesViewController.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class CitiesTableViewController: UITableViewController, UISearchControllerDelegate {
    
    private var cities = WeatherData.shared.cities
    private var filteredCities = [City]()
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.identifier)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Cities"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity(_ :)))
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .systemPurple
        
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search city"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredCities.count
        }
        return cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var city: City
        if isFiltering {
            city = filteredCities[indexPath.row]
        } else {
            city = cities[indexPath.row]
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as! CityTableViewCell
        cell.configure(city: city)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            WeatherData.shared.cities.remove(at: indexPath.row)
            WeatherData.shared.cityNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityWeatherCollectionViewController = CityWeatherDetailCollectionViewController(
            collectionViewLayout: UICollectionViewLayout()
        )
        var city = City()
        if isFiltering {
            city = filteredCities[indexPath.row]
        } else {
            city = cities[indexPath.row]
        }
        cityWeatherCollectionViewController.city = city
        navigationController?.pushViewController(cityWeatherCollectionViewController, animated: true)
    }
    
    @objc func addCity(_ : UIButton) {
        let alertController = UIAlertController(title: "Which city do you add?", message: "", preferredStyle: .alert)
        alertController.addTextField()
        let errorAlertController = UIAlertController(
            title: "Such a city does not exist",
            message: "Try again",
            preferredStyle: .alert
        )
        errorAlertController.addAction(UIAlertAction(title: "Ok", style: .destructive))
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in
            let text = alertController.textFields?.first?.text
            if !text!.isEmpty && !self.cities.contains(where: { $0.name == text }) {
                Task {
                    let city = try await WeatherService.loadCityWeather(city: text!)
                    if city.name != "Westminster" {
                        self.tableView.beginUpdates()
                        self.cities.insert(city, at: 0)
                        WeatherData.shared.cities.insert(city, at: 0)
                        WeatherData.shared.cityNames.insert(city.name, at: 0)
                        self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .fade)
                        self.tableView.endUpdates()
                    } else {
                        self.present(errorAlertController, animated: true)
                    }
                }
            }
        }))
        present(alertController, animated: true)
    }
}

extension CitiesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredCities = cities.filter({ (city: City) -> Bool in
            return city.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
}
