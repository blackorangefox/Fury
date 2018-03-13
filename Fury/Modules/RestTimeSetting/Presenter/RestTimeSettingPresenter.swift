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
        view.setByttonTitle(text: "START")
        let title = "Opened rest time setting"
        AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
    }
    
    func selectWorkTime(minuts: Int, seconds: Int) {
        flowStory.restMinuts = minuts
        flowStory.restSeconds = seconds
        let title = "Will open pre-start for"
        AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
        router.openPrestart(style: flowStory.style)
    }
}
