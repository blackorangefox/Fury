//
//  ClassicTimerClassicTimerViewInput.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol ClassicTimerViewInput: class {

    /**
        @author Mikhail Fokin
        Setup initial state of the view
    */

    func setupInitialState()
    func showLetGoButton()
    func showPauseButton()
    func showFinishButton()
    func showFinishOrContinueButton()
    func newTime(time: String)
}
