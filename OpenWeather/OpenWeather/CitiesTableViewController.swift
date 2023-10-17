//
//  CitiesViewController.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class CitiesTableViewController: UITableViewController, UISearchControllerDelegate {
    
    private var cityNames = [
        "Moscow",
        "Saint Petersburg",
        "Novosibirsk",
        "Yekaterinburg",
        "Nizhny Novgorod",
        "Krasnoyarsk",
        "Chelyabinsk",
        "Ufa",
        "Rostov-on-Don",
        "Krasnodar",
        "Omsk",
        "Voronezh",
        "Perm",
        "Volgograd"
    ]
    private var cities = [City]()
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
        for cityName in cityNames {
            Task {
                let city = try await WeatherService.loadCityWeather(city: cityName)
                cities.append(city)
                self.tableView.reloadData()
            }
        }
        view.backgroundColor = .white
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.identifier)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Cities"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity(_ :)))
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityWeatherCollectionViewController = CityWeatherCollectionViewController(collectionViewLayout: UICollectionViewLayout())
//        cityWeatherCollectionViewController.city = cities[indexPath.row]
        navigationController?.pushViewController(cityWeatherCollectionViewController, animated: true)
    }
    
    @objc func addCity(_ : UIButton) {
        let alertController = UIAlertController(title: "Какой город добавить?", message: "", preferredStyle: .alert)
        alertController.addTextField()
        alertController.addAction(UIAlertAction(title: "Ок", style: .default, handler: {_ in
            let text = alertController.textFields?.first?.text
//            if !text!.isEmpty && !cities.contains(where: { $0.name == text }) {
//                cities.append(City(name: text!, time: "00:45", weather: weather))
//                self.tableView.reloadData()
//            }
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

extension CitiesTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard !searchText.isEmpty else {
//            self.searchText = ""
//            isFiltered = false
//            self.tableView.reloadData()
//            return
//        }
//        self.searchText = searchText
//        isFiltered = true
//        self.tableView.reloadData()
    }
}

