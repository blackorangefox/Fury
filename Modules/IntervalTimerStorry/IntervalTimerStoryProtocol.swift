//
//  IntervalTimerStoryProtocol.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation

protocol IntervalTimerStoryProtocol {
    var sets: Int {get set}
    var workMinuts: Int {get set}
    var workSeconds: Int {get set}
    var restMinuts: Int {get set}
    var restSeconds: Int {get set}
    var type: timerType {get set}
}
