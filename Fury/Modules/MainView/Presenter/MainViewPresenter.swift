//
//  MainViewMainViewPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class MainViewPresenter:  MainViewViewOutput, MainViewInteractorOutput {

    weak var view: MainViewViewInput!
    var interactor: MainViewInteractorInput!
    var router: MainViewRouterInput!
    var flowStory: TimerStoryProtocol!

    func viewIsReady() {

    }
    
    func openTimer(type: TimerType) {
        flowStory.style = TimerStyle(by: type)
        interactor.sentAnalitic(type: type)
        router.open()
    }
}
