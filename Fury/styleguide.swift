//
//  styleguide.swift
//  Fury
//
//  Created by Mikhail Fokin on 02/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import UIKit

// Sample color palette

extension UIColor {
    class var furyYellow: UIColor {
        return UIColor(red: 254.0 / 255.0, green: 207.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
    }
    
    class var furyLightOrange: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 189.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0)
    }
    
    class var furyPeach: UIColor {
        return UIColor(red: 238.0 / 255.0, green: 103.0 / 255.0, blue: 35.0 / 255.0, alpha: 1.0)
    }
}

// Sample text styles

extension UIFont {
    class func furyHeaderFont() -> UIFont {
        return UIFont.systemFont(ofSize: 24.0, weight: UIFontWeightRegular)
    }
}
