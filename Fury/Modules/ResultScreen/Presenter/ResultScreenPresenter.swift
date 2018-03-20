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
        let title = "Opend result controller for"
        AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
    }
    
    func okButtonPress() {
        if needShowSurveyControlle() {
            let title = "Will open survey after"
            AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
            router.openSurveyView(style: flowStory.style)
        } else {
            let title = "Will open main controller after"
            AnaliticServer.createAnalitic(title: title, type: flowStory.style.type)
            router.openMainView()
        }
    }
    
    func needShowSurveyControlle() -> Bool {
        if UserDefaults.standard.bool(forKey: "user_survey") {
            return false
        }
        
        var counter = UserDefaults.standard.integer(forKey: "CounterStartTimer")
        if counter >= 6 {
            return true
        } else {
            counter += 1
            UserDefaults.standard.set(counter, forKey: "CounterStartTimer")
            return false
        }
    }
}
