//
//  PreViewTimerPreViewTimerPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class PreViewTimerPresenter: PreViewTimerViewOutput, PreViewTimerInteractorOutput {

    weak var view: PreViewTimerViewInput!
    var interactor: PreViewTimerInteractorInput!
    var router: PreViewTimerRouterInput!
    var flowStory: TimerStoryProtocol!

    func viewIsReady() {
        view.stylize(by: flowStory.style)
    }
    
    func closeButtonPress() {
        interactor.analiticCloseButtonPress(type: flowStory.style.type)
    }
    
    func playButtonPress() {
        switch flowStory.style.type {
        case  .interval:
            let title = "Will open round set for"
            AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
            router.openRoundSetting()
        case .countdown:
            let title = "Will open work time set for"
            AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
            router.openSetWorkTime()
        case .classic:
            let title = "Will open pre-start for"
            AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
            router.openPrestart(style: flowStory.style)
        }
    }
}
