//
//  CoutdownTimerCoutdownTimerPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 31/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class CoutdownTimerPresenter: CoutdownTimerModuleInput, CoutdownTimerViewOutput, CoutdownTimerInteractorOutput {

    weak var view: CoutdownTimerViewInput!
    var interactor: CoutdownTimerInteractorInput!
    var router: CoutdownTimerRouterInput!

    func viewIsReady() {

    }
}
