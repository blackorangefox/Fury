//
//  UIColor+FURYAdditions.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import UIKit
// Color palette

extension UIColor {
    @nonobjc class var furyYellowGreen: UIColor {
        return UIColor(red: 194.0 / 255.0, green: 255.0 / 255.0, blue: 59.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var furyWhite5: UIColor {
        return UIColor(white: 255.0 / 255.0, alpha: 0.05)
    }
}

// Text styles

extension UIFont {
    class func furyTextStyleFont() -> UIFont? {
        return UIFont(name: "RobotoCondensed-Bold", size: 180.0)
    }
    
    class func furyTextStyle4Font() -> UIFont? {
        return UIFont(name: "RobotoCondensed-Bold", size: 48.0)
    }
    
    class func furyTextStyle2Font() -> UIFont? {
        return UIFont(name: "RobotoCondensed-Bold", size: 28.0)
    }
    
    class func furyTextStyle3Font() -> UIFont? {
        return UIFont(name: "RobotoCondensed-Bold", size: 26.0)
    }
}
