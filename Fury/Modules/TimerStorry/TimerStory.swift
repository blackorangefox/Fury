//
//  IntervalTimerStory.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation

class TimerStory: TimerStoryProtocol {
    var sets: Int = 0
    var workMinuts: Int = 0
    var workSeconds: Int = 0
    var restMinuts: Int = 0
    var restSeconds: Int = 0
    var type: timerType = .classic
}
