//
//  Location.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 11.04.2023.
//

import Foundation
import UIKit

//protocol LocationInputActivationViewDelegate: class {
//    func presentLoactionInputView()
//}


class WhereTo: UIView {
    
    //MARK: - Properties
    
//    weak var delegate: LocationInputActivationViewDelegate?
    
    private let indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    //MARK: - Lifecyrcle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicatorView.setDimensions(height: 6, width: 6)
        
        addSubview(placeholderLabel)
        placeholderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 28)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(handleShowLocationInputView))
//        addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func handleShowLocationInputView() {
//        delegate?.presentLoactionInputView()
//    }
}
