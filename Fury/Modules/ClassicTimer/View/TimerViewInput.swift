//
//  ClassicTimerClassicTimerViewInput.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol TimerViewInput: class {

    /**
        @author Mikhail Fokin
        Setup initial state of the view
    */

    func setupInitialState(type: timerType)
    func showPauseButton()
    func showFinishOrContinueButton()
    func newTime(time: String)
    func updateLapsTitle(titles: [String])
    func createClassicTimer(minuts: Int, seconds: Int, miliseconds: Int)
    func createCountDownTimer(minuts: Int, seconds: Int, miliseconds: Int)
    func createIntervalTimer(sets: Int, workMinuts: Int, workSeconds: Int, restMinuts: Int, restSeconds: Int)
    func resetTimer(type: timerType)
}
