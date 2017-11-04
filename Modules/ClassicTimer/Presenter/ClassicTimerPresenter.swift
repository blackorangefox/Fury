//
//  ClassicTimerClassicTimerPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

class ClassicTimerPresenter: ClassicTimerModuleInput, ClassicTimerViewOutput, ClassicTimerInteractorOutput, TimerServiceDelegate {

    weak var view: ClassicTimerViewInput!
    var interactor: ClassicTimerInteractorInput!
    var router: ClassicTimerRouterInput!
    var timerService: TimerServiceProtocol!
    private let formater = DateFormatter()

    func viewIsReady() {
        formater.dateFormat = "mm:ss:SS"
    }
    
    func letsGoButtonPress() {
        let time = formater.date(from: "00:00:00")
        timerService.startWith(time: time!, type: .classic)
        timerService.delegate = self
        view.showPauseButton()
    }
    
    func newTime(time: Date) {
        let format = DateFormatter()
        format.dateFormat = "mm:ss:SS"
        let timeForString = format.string(from: time)
        view.newTime(time: timeForString)
    }
    
    func timerFinish() {
        
    }
    
    func pauseButtonPress() {
        timerService.pause()
        view.showFinishOrContinueButton()
    }
    
    func finishButtonPress() {
    
    }
    
    func continueButtonPress() {
        timerService.resume()
        view.showPauseButton()
    }
    
    func intervalButtonPress() {
        router.openIntervalTimer()
    }
    
    func resetButtonPress() {
        letsGoButtonPress()
    }
}
