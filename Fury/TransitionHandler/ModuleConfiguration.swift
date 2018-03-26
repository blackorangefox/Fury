//
//  ModuleConfiguration.swift
//  Fury
//
//  Created by Mikhail Fokin on 26/03/2018.
//  Copyright © 2018 Mikhail Fokin. All rights reserved.
//

import Foundation

public protocol ModuleConfiguration {}

public protocol ModuleConfigurable {
    func configure(with configuration: ModuleConfiguration)
}

public protocol ModuleConfigurableProvider {
    var configurable: ModuleConfigurable? { get }
}
