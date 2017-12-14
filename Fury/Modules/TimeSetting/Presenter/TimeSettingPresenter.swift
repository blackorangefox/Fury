//
//  TimeSettingTimeSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class TimeSettingPresenter: TimeSettingModuleInput, TimeSettingViewOutput, TimeSettingInteractorOutput {

    weak var view: TimeSettingViewInput!
    var interactor: TimeSettingInteractorInput!
    var router: TimeSettingRouterInput!

    func viewIsReady() {

    }
}
