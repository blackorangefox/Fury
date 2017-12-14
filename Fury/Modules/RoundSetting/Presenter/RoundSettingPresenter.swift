//
//  RoundSettingRoundSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class RoundSettingPresenter: RoundSettingModuleInput, RoundSettingViewOutput, RoundSettingInteractorOutput {

    weak var view: RoundSettingViewInput!
    var interactor: RoundSettingInteractorInput!
    var router: RoundSettingRouterInput!

    func viewIsReady() {

    }
}
