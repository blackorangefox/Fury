//
//  TimerServiceProtocol.swift
//  Fury
//
//  Created by Mikhail Fokin on 23/07/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation

protocol TimerServiceProtocol {
    var delegate: TimerServiceDelegate! {get set}
    
    func startWith(time: Date, type: TimerType)
    func applicationDidBecomeActive()
    func applicationDidEnterBackground()
    func resume()
    func pause()
}
