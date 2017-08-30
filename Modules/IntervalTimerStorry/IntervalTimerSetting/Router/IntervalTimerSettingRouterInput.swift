//
//  IntervalTimerSettingIntervalTimerSettingRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

protocol IntervalTimerSettingRouterInput {

	weak var viewController: IntervalTimerSettingViewController? { get set }
    
    func openIntervalTimer()
    func openClassicInterval()
    func openCountdown()
}
