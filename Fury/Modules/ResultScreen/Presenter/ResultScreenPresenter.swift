//
//  ResultScreenResultScreenPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 13/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import Foundation

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
            router.openSurveyView(style: flowStory.style)
        } else {
            router.openMainView()
        }
    }
    
    func needShowSurveyControlle() -> Bool {
        let counter = UserDefaults.standard.integer(forKey: "CounterStartTimer")
        if counter >= 3 && !UserDefaults.standard.bool(forKey: "user_survey") sur{
            return true
        }
        return false
    }
}
