//
//  ModulesAssembly.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import Swinject

class ModulesAssembly: BaseAssembly {
    
    static func configure() {
        
        let container = defaultContainer()
        
        IntervalTimerSettingAssembly.configure()
        IntervalTimerAssembly.configure()
        ClassicTimerAssembly.configure()
    }
}
