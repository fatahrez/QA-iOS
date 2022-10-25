//
//  Color+Extension.swift
//  QA
//
//  Created by Abdulfatah Mohamed on 23/10/2022.
//  Copyright © 2022 apple. All rights reserved.
//

import UIKit

extension UIColor {
    static var buttonColor: UIColor {
        return UIColor.color(name: "Button Color")
    }
    
    static var backgroundColor: UIColor {
        return UIColor.color(name: "Background Color")
    }

    static var bgCardGreen: UIColor {
        return UIColor.color(name: "Bg Card Green")
    }
    
    static var bgCardRed: UIColor {
        return UIColor.color(name: "Bg Card Red")
    }
    
    static var bgCardYellow: UIColor {
        return UIColor.color(name: "Bg Card Yellow")
    }
    
    static var bgCardPink: UIColor {
        return UIColor.color(name: "Bg Card Pink")
    }
    
    static var bgCardTeal: UIColor {
        return UIColor.color(name: "Bg Card Teal")
    }
    
    static var bgCardOrange: UIColor {
        return UIColor.color(name: "Bg Card Orange")
    }
    
    static var bgCardBlack: UIColor {
        return UIColor.color(name: "Bg Card Black")
    }
    
    static var bgCardBlue: UIColor {
        return UIColor.color(name: "Bg Card Green")
    }
    
    static var smokeWhite: UIColor {
        return UIColor.color(name: "Smoke White")
    }
    
    private static func color(name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            return .black
        }
        return color
    }
}
