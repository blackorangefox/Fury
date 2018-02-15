//
//  HealthKitManager.swift
//  Fury
//
//  Created by Mikhail Fokin on 30/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import HealthKit

class HealthKitManager: NSObject {
    
    static let healthKitStore = HKHealthStore()
    
    static func authorizeHealthKit() {
        
        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
        ]
        
        healthKitStore.requestAuthorization(toShare: healthKitTypes,
                                            read: healthKitTypes) { _, _ in }
    }
}
