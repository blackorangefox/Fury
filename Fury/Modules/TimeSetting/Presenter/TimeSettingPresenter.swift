//
//  TimeSettingTimeSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import Mixpanel

class TimeSettingPresenter: TimeSettingModuleInput, TimeSettingViewOutput, TimeSettingInteractorOutput {

    weak var view: TimeSettingViewInput!
    var interactor: TimeSettingInteractorInput!
    var router: TimeSettingRouterInput!
     var flowStory: TimerStoryProtocol!
    
    func viewIsReady() {
        view.stylez(style: flowStory.style)
        view.setTitle(text: "Set round time")
        if flowStory.style.type != .interval {
            view.setByttonTitle(text: "START")
        }
    }
    
    func selectWorkTime(minuts: Int,
                        seconds: Int) {
        flowStory.workMinuts = minuts
        flowStory.workSeconds = seconds
        if flowStory.style.type == .interval {
            router.openSetRestTime()
        }else {
            Mixpanel.mainInstance().track(event: "Start countdown timer")
            router.openPrestert(style: flowStory.style)
        }
    }
}
