//
//  IntervalTimerStory.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation

class IntervalTimerStory: IntervalTimerStoryProtocol {
    var sets: Int = 10
    var workMinuts: Int = 0
    var workSeconds: Int = 10
    var restMinuts: Int = 0
    var restSeconds: Int = 5
    var type: timerType = .interval
}
