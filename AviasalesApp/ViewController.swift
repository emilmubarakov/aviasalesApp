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
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let whereFromView: WhereFrom = {
        let view = WhereFrom()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let whereToView: WhereTo = {
        let view = WhereTo()
        view.layer.cornerRadius = 8
        return view
    }()
    
//    private let departureLabel: UIView = {
//        le
//    }
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        configurUI()
    }
    
    func configurUI() {
        configureFirstLabel()
        configureSecondLabel()
        configureWhereFrom()
        configureWhereTo()
        configureCentralView()
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
            centralView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            centralView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            centralView.heightAnchor.constraint(equalToConstant: 100)])
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
            whereToView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            whereToView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            whereToView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}

