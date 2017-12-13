//
//  PreViewTimerPreViewTimerPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class PreViewTimerPresenter: PreViewTimerModuleInput, PreViewTimerViewOutput, PreViewTimerInteractorOutput {

    weak var view: PreViewTimerViewInput!
    var interactor: PreViewTimerInteractorInput!
    var router: PreViewTimerRouterInput!
    var flowStory: TimerStoryProtocol!

    func viewIsReady() {

    }
    
    func playButtonPress(type: timerType) {
        flowStory.type = type
        router.openPreStartController()
    }
}
