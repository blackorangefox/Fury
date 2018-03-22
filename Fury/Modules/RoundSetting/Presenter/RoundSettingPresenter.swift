//
//  RoundSettingRoundSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class RoundSettingPresenter: RoundSettingViewOutput {

    weak var view: RoundSettingViewInput!
    var router: RoundSettingRouterInput!
    var flowStory: TimerStoryProtocol!

    func viewIsReady() {
        view.stylez(style: flowStory.style)
        let title = "Opened round set for"
        AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
    }
    
    func selectSets(sets: Int) {
        let title = "Will open work time set for"
        AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
        
        flowStory.sets = sets
        router.openSetWorkTime()
    }
}
