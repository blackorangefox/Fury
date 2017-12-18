//
//  RoundSettingRoundSettingViewInput.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol RoundSettingViewInput: class {

    /**
        @author Mikhail Fokin
        Setup initial state of the view
    */

    func setupInitialState()
    func stylez(style: TimerStyle)
}
