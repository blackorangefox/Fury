//
//  PreViewTimerPreViewTimerRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

protocol PreViewTimerRouterInput {

	weak var view: PreViewTimerViewController? { get set }
    func open(timerType: TimerType)
//    func openPrestart(style: TimerStyle)
//    func openRoundSetting()
//    func openSetWorkTime()
}
