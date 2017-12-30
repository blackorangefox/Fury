//
//  RecordVideoRecordVideoPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 25/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class RecordVideoPresenter: RecordVideoModuleInput, RecordVideoViewOutput, RecordVideoInteractorOutput {

    weak var view: RecordVideoViewInput!
    var interactor: RecordVideoInteractorInput!
    var router: RecordVideoRouterInput!

    func viewIsReady() {

    }
}
