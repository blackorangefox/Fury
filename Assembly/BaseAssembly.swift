//
//  BaseAssembly.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import Swinject

protocol BaseAssembly {
    static func configure()
}

extension BaseAssembly {
    static func resolve<Service>(type: Service.Type) -> Service? {
        return defaultContainer().resolve(type)
    }
    
    static func resolve<Service>(type: Service.Type, name: String) -> Service? {
        return defaultContainer().resolve(type, name: name)
    }
    
    static func defaultContainer() -> Container {
        return (UIApplication.shared.delegate as? AppDelegate)?.container ?? Container()
    }
}
