//
//  ResultScreenResultScreenPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 13/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//


class ResultScreenPresenter: ResultScreenModuleInput, ResultScreenViewOutput, ResultScreenInteractorOutput {

    weak var view: ResultScreenViewInput!
    var interactor: ResultScreenInteractorInput!
    var router: ResultScreenRouterInput!
    var flowStory: TimerStoryProtocol!
    
    func viewIsReady() {
        view.styleze(by: flowStory.style)
        view.setHero(type: flowStory.style.type)
    }
    
    func okButtonPress() {
        if needShowSurveyControlle() {
            
        } else {
            router.openMainView()
        }
    }
    
    func needShowSurveyControlle() -> Bool {
        return false
    }
}
