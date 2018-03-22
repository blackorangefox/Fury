//
//  Date+extension.swift
//  Fury
//
//  Created by Mikhail Fokin on 25/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation

extension Date {
    
    func isEmpty(dateFormat: String) -> Bool {
        let intervalFormater = DateFormatter()
        intervalFormater.dateFormat = dateFormat
        let time = intervalFormater.string(from: self)
        if time == "00:00" {
            return true
        }else {
            return false
        }
    }
}
