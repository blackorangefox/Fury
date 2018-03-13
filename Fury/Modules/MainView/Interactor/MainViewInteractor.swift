//
//  MainViewMainViewInteractor.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Firebase

class MainViewInteractor: MainViewInteractorInput {

    weak var output: MainViewInteractorOutput!
    
    func sentAnalitic(type: TimerType) {
        let title = "press on main screnn"
        AnaliticServer.createAnalitic(title: title, type: type)
    }
}
