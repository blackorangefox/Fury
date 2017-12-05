//
//  ClassicTimerClassicTimerPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

class ClassicTimerPresenter: ClassicTimerModuleInput, ClassicTimerViewOutput {
    
    weak var view: ClassicTimerViewInput!
    var router: ClassicTimerRouterInput!
    var timerService: TimerServiceProtocol!
    private let formater = DateFormatter()

    func viewIsReady() {
        
    }
    
    func letsGoButtonPress() {
        view.showPauseButton()
    }
    
    func resetButtonPress() {
        letsGoButtonPress()
    }
    
    func timerFinish() {
        view.showFinishOrContinueButton()
    }
    
    func pauseButtonPress() {
        view.showFinishOrContinueButton()
    }
    
    func finishButtonPress(with time: String) {
        view.showLetGoButton()
        router.openFinishView(with: time)
    }
    
    func continueButtonPress() {
        view.showPauseButton()
    }
}
