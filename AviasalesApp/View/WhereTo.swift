//
//  Location.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 11.04.2023.
//

import Foundation
import UIKit

protocol LocationInputActivationViewDelegate: class {
    func presentLoactionInputView()
}


class WhereTo: UIView {
    
    //MARK: - Properties
    
    weak var delegate: LocationInputActivationViewDelegate?
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    
    //MARK: - Lifecyrcle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleShowLocationInputView))
        addGestureRecognizer(tap)
        
        configurPlaceHolderLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleShowLocationInputView() {
        delegate?.presentLoactionInputView()
    }
    
    private func configurPlaceHolderLabel() {
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
}
