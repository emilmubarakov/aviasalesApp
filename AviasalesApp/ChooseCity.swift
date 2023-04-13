//
//  ChooseCity.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 13.04.2023.
//

import Foundation
import UIKit

class ChooseCity: UIViewController {
    
    var city = ["Moscow", "Kazan", "Los Angeles", "Bangkok", "Paris"]
    var filteredCities = [String]()
    var isSearching = false
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 14
        return tableView
    }()
    
    private let searchTextField: UISearchBar = {
        let textField = UISearchBar()
        textField.placeholder = "   To"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        searchTextField.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        view.backgroundColor = .rgb(red: 240, green: 241, blue: 246)
        
        configurUI()
    }
    
    func configurUI() {
        configureSearchTextField()
        configureTableView()
    }
    
    func configureSearchTextField() {
        view.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)])
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.frame = view.bounds
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)])
    }
    
}

extension ChooseCity: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredCities.count : city.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = isSearching ? filteredCities[indexPath.row] : city[indexPath.row]
        
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
            filteredCities = city.filter({ $0.lowercased().contains(searchText.lowercased())})
            tableView.reloadData()
        }
    }
}
