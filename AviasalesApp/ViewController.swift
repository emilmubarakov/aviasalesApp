//
//  ViewController.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 11.04.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let centralView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        return view
    }()
    
    private let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .rgb(red: 237, green: 237, blue: 237)
        return view
    }()
    
    private let whereFromView: WhereFrom = {
        let view = WhereFrom()
        view.layer.cornerRadius = 14
        return view
    }()
    
    private let whereToView: WhereTo = {
        let view = WhereTo()
        view.layer.cornerRadius = 14
        return view
    }()
    
    private let titleLabelFirst: UILabel = {
        let label = UILabel()
        label.text = "Cheap flights"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let titleLabelSecond: UILabel = {
        let label = UILabel()
        label.text = "and airline tickets"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let dateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Dates", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setImage(UIImage(named: "calendar.badge.clock"), for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let passengersButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("1, economy", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Filters", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        configurUI()
    }
    
    func configurUI() {
        configureFirstLabel()
        configureSecondLabel()
        configureCentralView()
        configureWhereFrom()
        configureWhereTo()
        configureSeparateView()
        configureDateButton()
        configurePassengersButton()
        configureFilterButton()
    }
    
    func configureFirstLabel() {
        view.addSubview(titleLabelFirst)
        titleLabelFirst.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabelFirst.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabelFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabelFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
    
    func configureSecondLabel() {
        view.addSubview(titleLabelSecond)
        titleLabelSecond.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabelSecond.topAnchor.constraint(equalTo: titleLabelFirst.bottomAnchor),
            titleLabelSecond.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabelSecond.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
        ])
    }
    
    func configureCentralView() {
        view.addSubview(centralView)
        centralView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            centralView.topAnchor.constraint(equalTo: titleLabelSecond.bottomAnchor, constant: 15),
            centralView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            centralView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            centralView.heightAnchor.constraint(equalToConstant: 100)])
    }
    
    func configureSeparateView() {
        view.addSubview(separateView)
        separateView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            separateView.topAnchor.constraint(equalTo: centralView.topAnchor, constant: 50),
            separateView.leadingAnchor.constraint(equalTo: centralView.leadingAnchor, constant: 10),
            separateView.trailingAnchor.constraint(equalTo: centralView.trailingAnchor),
            separateView.heightAnchor.constraint(equalToConstant: 0.9)])
    }
    
    func configureWhereFrom() {
        view.addSubview(whereFromView)
        whereFromView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whereFromView.topAnchor.constraint(equalTo: centralView.topAnchor),
            whereFromView.leadingAnchor.constraint(equalTo: centralView.leadingAnchor),
            whereFromView.trailingAnchor.constraint(equalTo: centralView.trailingAnchor),
            whereFromView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureWhereTo() {
        view.addSubview(whereToView)
        whereToView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whereToView.topAnchor.constraint(equalTo: whereFromView.bottomAnchor),
            whereToView.leadingAnchor.constraint(equalTo: centralView.leadingAnchor),
            whereToView.trailingAnchor.constraint(equalTo: centralView.trailingAnchor),
            whereToView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureDateButton() {
        view.addSubview(dateButton)
        dateButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateButton.topAnchor.constraint(equalTo: centralView.bottomAnchor, constant: 8),
            dateButton.leadingAnchor.constraint(equalTo: centralView.leadingAnchor),
            dateButton.widthAnchor.constraint(equalToConstant: 80),
            dateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configurePassengersButton() {
        view.addSubview(passengersButton)
        passengersButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passengersButton.topAnchor.constraint(equalTo: centralView.bottomAnchor, constant: 8),
            passengersButton.leadingAnchor.constraint(equalTo: dateButton.trailingAnchor, constant: 5),
            passengersButton.widthAnchor.constraint(equalToConstant: 120),
            passengersButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureFilterButton() {
        view.addSubview(filterButton)
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: centralView.bottomAnchor, constant: 8),
            filterButton.leadingAnchor.constraint(equalTo: passengersButton.trailingAnchor, constant: 5),
            filterButton.widthAnchor.constraint(equalToConstant: 80),
            filterButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }


}

