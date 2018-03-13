//
//  TimeSettingTimeSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

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
        
        let title = "Opened work time set for"
        AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
    }
    
    func selectWorkTime(minuts: Int,
                        seconds: Int) {
        flowStory.workMinuts = minuts
        flowStory.workSeconds = seconds
        if flowStory.style.type == .interval {
            let title = "Will open rest time set for"
            AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
            router.openSetRestTime()
        }else {
            let title = "Will open pre-start for"
            AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
            router.openPrestart(style: flowStory.style)
        }
    }
}
