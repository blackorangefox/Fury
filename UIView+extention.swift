//
//  UIView+extention.swift
//  Fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

extension UIView {
        
    func setGradienBackgroundBy(colors: [Any], size: CGSize) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
