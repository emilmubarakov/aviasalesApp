//
//  Extensiom.swift
//  AviasalesApp
//
//  Created by e.mubarakov on 11.04.2023.
//

import UIKit

extension UIColor {
    
    static let lightGreyBackgroundColor = UIColor.rgb(red: 59, green: 62, blue: 67)
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
