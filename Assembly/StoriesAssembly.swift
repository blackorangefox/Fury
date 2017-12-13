//
//  StoriesAssembly.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import Swinject

class StoriesAssembly: BaseAssembly {
    static func configure() {
        
        defaultContainer().register(TimerStoryProtocol.self) { _ in
            TimerStory()
            }.inObjectScope(.container)
    }
}

