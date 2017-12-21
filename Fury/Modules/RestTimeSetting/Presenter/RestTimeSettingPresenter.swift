//
//  RestTimeSettingRestTimeSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 18/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import Mixpanel

class RestTimeSettingPresenter: RestTimeSettingModuleInput, TimeSettingViewOutput, RestTimeSettingInteractorOutput {
    
    weak var view: TimeSettingViewInput!
    var interactor: RestTimeSettingInteractorInput!
    var router: RestTimeSettingRouterInput!
    var  flowStory: TimerStoryProtocol!
    
    func viewIsReady() {
        view.stylez(style: flowStory.style)
        view.setTitle(text: "Set rest time")
        Mixpanel.mainInstance().track(event: "Open rest time setting")
    }
    
    func selectWorkTime(minuts: Int, seconds: Int) {
        flowStory.restMinuts = minuts
        flowStory.restSeconds = seconds
        Mixpanel.mainInstance().track(event: "Start interval timer")
        router.openPrestert(style: flowStory.style)
    }
}
