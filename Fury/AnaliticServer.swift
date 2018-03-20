//
//  AnaliticServer.swift
//  Fury
//
//  Created by Mikhail Fokin on 13/03/2018.
//  Copyright © 2018 Mikhail Fokin. All rights reserved.
//

import Foundation
import Firebase
import Mixpanel

class AnaliticServer {
    
    static func createAnalitic(title: String, type: TimerType?) {
        var message = title
        
        switch type {
        case .classic?:
            message = message + " classic timer"
        case .interval?:
            message = message + " interval timer"
        case .countdown?:
            message = message + " countdown timer"
        case .none:
            message = message + " "
        }
        
        Mixpanel.mainInstance().track(event: message)
        
        Analytics.logEvent(message, parameters: [
            AnalyticsParameterItemID: "id-\(message)" as NSObject,
            AnalyticsParameterItemName: message as NSObject
            ])
    }
    
}
