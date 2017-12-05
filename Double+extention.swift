//
//  Double+extention.swift
//  Fury
//
//  Created by Mikhail Fokin on 29/11/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
