//
//  RestTimeSettingRestTimeSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 18/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class RestTimeSettingPresenter: RestTimeSettingModuleInput, TimeSettingViewOutput, RestTimeSettingInteractorOutput {
    
    weak var view: TimeSettingViewInput!
    var interactor: RestTimeSettingInteractorInput!
    var router: RestTimeSettingRouterInput!
    var  flowStory: TimerStoryProtocol!
    
    func viewIsReady() {
        view.stylez(style: flowStory.style)
        view.setTitle(text: "Set rest time")
    }
    
    func selectWorkTime(minuts: Int, seconds: Int) {
        flowStory.restMinuts = minuts
        flowStory.restSeconds = seconds
        router.openPrestert()
    }
}
