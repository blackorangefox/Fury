//
//  IntervalTimerStoryProtocol.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation

protocol IntervalTimerStoryProtocol {
    var laps: Int! {get set}
    var roundTime: Date! {get set}
    var restDate: Date! {get set}
    var type: TimerType! {get set}
}
