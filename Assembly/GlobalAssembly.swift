//
//  GlobalAssembly.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import Swinject

class GlobalAssembly: BaseAssembly {
    static func configure() {
        ModulesAssembly.configure()
        StoriesAssembly.configure()
        ServiceAssembly.configure()
    }
}
