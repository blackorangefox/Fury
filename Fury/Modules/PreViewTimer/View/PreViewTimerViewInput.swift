//
//  PreViewTimerPreViewTimerViewInput.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol PreViewTimerViewInput: class {

    /**
        @author Mikhail Fokin
        Setup initial state of the view
    */

    func setupInitialState()
    func stylize(by style: TimerStyle)
}
