//
//  RestTimeSettingRestTimeSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 18/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class RestTimeSettingPresenter: RestTimeSettingModuleInput, RestTimeSettingViewOutput, RestTimeSettingInteractorOutput {

    weak var view: RestTimeSettingViewInput!
    var interactor: RestTimeSettingInteractorInput!
    var router: RestTimeSettingRouterInput!

    func viewIsReady() {

    }
}
