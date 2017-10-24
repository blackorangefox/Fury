//
//  IntervalTimerIntervalTimerViewOutput.swift
//  fury
//
//  Created by Mikhail Fokin on 18/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol IntervalTimerViewOutput {

    /**
        @author Mikhail Fokin
        Notify presenter that view is ready
    */

    func viewIsReady()
    func pauseButtonPress()
    func continuePress()
    func finishButton()
}
