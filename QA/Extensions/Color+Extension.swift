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

    private static func color(name: String) -> UIColor {
        guard let color = UIColor(named: name) else {
            return .black
        }
        return color
    }
}
