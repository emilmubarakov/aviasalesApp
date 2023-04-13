//
//  WhereFrom.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 12.04.2023.
//

import Foundation
import UIKit

protocol WhereFromViewDelegate: class {
    func presentWhereFromView()
}


class WhereFrom: UIView {
    
    //MARK: - Properties
    
    weak var delegate: WhereFromViewDelegate?
    
//    private let indicatorView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .black
//        return view
//    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where from"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    
    //MARK: - Lifecyrcle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
//        addSubview(indicatorView)
//        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
//        indicatorView.setDimensions(height: 6, width: 6)
        
        addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            placeholderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleShowWhereFromView))
        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleShowWhereFromView() {
        delegate?.presentWhereFromView()
    }
}
