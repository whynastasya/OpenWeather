//
//  CitiesViewController.swift
//  OpenWeather
//
//  Created by nastasya on 28.06.2023.
//

import UIKit

final class CitiesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.identifier)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Города"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity(_ :)))
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as! CityTableViewCell
        cell.configure(city: cities[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityWeatherCollectionViewController = CityWeatherCollectionViewController(collectionViewLayout: UICollectionViewLayout())
        cityWeatherCollectionViewController.city = cities[indexPath.row]
        navigationController?.pushViewController(cityWeatherCollectionViewController, animated: true)
    }
    
    @objc func addCity(_ : UIButton) {
        let alertController = UIAlertController(title: "Какой город добавить?", message: "", preferredStyle: .alert)
        alertController.addTextField()
        alertController.addAction(UIAlertAction(title: "Ок", style: .default, handler: {_ in
            let text = alertController.textFields?.first?.text
            if !text!.isEmpty && !cities.contains(where: { $0.name == text }) {
                cities.append(City(name: text!, time: "00:45", weather: weather))
                self.tableView.reloadData()
            }
        }))
        present(alertController, animated: true)
    }
}


