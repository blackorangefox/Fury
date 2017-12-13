//
//  MainViewMainViewPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class MainViewPresenter: MainViewModuleInput, MainViewViewOutput, MainViewInteractorOutput {

    weak var view: MainViewViewInput!
    var interactor: MainViewInteractorInput!
    var router: MainViewRouterInput!

    func viewIsReady() {

    }
    
    func openTimer(type: timerType) {
        router.open(type: type)
    }
}
