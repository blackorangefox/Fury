//
//  GlobalAssembly.swift
//  Fury
//
//  Created by Mikhail Fokin on 23/07/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation

class GlobalAssembly: BaseAssembly {
    
    static func configure() {
        let container = defaultContainer()
        
        container.register(TimerServiceProtocol.self) { r in
            TimerService()
            }.inObjectScope(.container)
    }
}
