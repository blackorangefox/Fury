//
//  ClassicTimerClassicTimerViewOutput.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol ClassicTimerViewOutput {

    /**
        @author Mikhail Fokin
        Notify presenter that view is ready
    */

    func viewIsReady()
    func letsGoButtonPress()
    func pauseButtonPress()
    func finishButtonPress()
    func continueButtonPress()
    func intervalButtonPress()
    func resetButtonPress()
}
