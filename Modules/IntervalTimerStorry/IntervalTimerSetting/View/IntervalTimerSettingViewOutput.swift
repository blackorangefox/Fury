//
//  IntervalTimerSettingIntervalTimerSettingViewOutput.swift
//  fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

protocol IntervalTimerSettingViewOutput {

    /**
        @author Mikhail Fokin
        Notify presenter that view is ready
    */

    func viewIsReady()
    func letsGoButtonPress(laps: Int, roundTime: String, restTime: String)
    func classicButtonPress()
    func countdownButtonPress()
}
