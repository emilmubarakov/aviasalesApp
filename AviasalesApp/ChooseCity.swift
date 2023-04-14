//
//  ChooseCity.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 13.04.2023.
//

import Foundation
import UIKit

class ChooseCity: UIViewController {
    
    let url = "https://jsonplaceholder.typicode.com/posts"
//    private var temperatureData: [StoryElement] = []
    private var titleArray: [String] = []

//    var city = ["Moscow", "Kazan", "Los Angeles", "Bangkok", "Paris"]
    var filteredCities = [String]()
    var isSearching = false
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 14
        return tableView
    }()
    
    private let citySearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "To"
        searchBar.layer.cornerRadius = 10
        return searchBar
    }()
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        citySearchBar.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.backgroundColor = .rgb(red: 240, green: 241, blue: 246)
        
        configurUI()
        
        getData(from: url) { [weak self] value in
            DispatchQueue.main.async {
                let temperatureData = value
                
                for i in 0..<temperatureData.count {
                    self?.titleArray.append(temperatureData[i].title!)
                }
                self?.tableView.reloadData()
            }
        }
    }
    
    func configurUI() {
        configureSearchTextField()
        configureTableView()
    }
    
    func configureSearchTextField() {
        view.addSubview(citySearchBar)
        citySearchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            citySearchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            citySearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            citySearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            citySearchBar.heightAnchor.constraint(equalToConstant: 50)])
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: citySearchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)])
    }
    
    private func getData(from url: String, completion: @escaping ([StoryElement]) -> Void) {
        
        let url = URL(string: url)!
        var request = URLRequest(url: url)
            
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data else { return }
            if let weatherData = try? JSONDecoder().decode(Story.self, from: data) {
                completion(weatherData)
            } else {
                print("Fail")
            }
        }
        task.resume()
    }
}

extension ChooseCity: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredCities.count : titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = isSearching ? filteredCities[indexPath.row] : titleArray[indexPath.row]
        
        return cell
    }
}

extension ChooseCity: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            isSearching = false
            tableView.reloadData()
        } else {
            isSearching = true
            filteredCities = titleArray.filter({ $0.lowercased().contains(searchText.lowercased())})
            tableView.reloadData()
        }
    }
}
