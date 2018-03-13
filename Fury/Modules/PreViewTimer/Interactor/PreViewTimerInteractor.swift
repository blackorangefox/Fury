//
//  PreViewTimerPreViewTimerInteractor.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

class PreViewTimerInteractor: PreViewTimerInteractorInput {
    
    weak var output: PreViewTimerInteractorOutput!
    
    func analiticCloseButtonPress(type: TimerType) {
        let title = "press close button on pre-view screnn"
        AnaliticServer.createAnalitic(title: title, type: type)
    }
    
    func analiticNextController(type: TimerType) {
        let title = "press play button on pre-view screnn"
        AnaliticServer.createAnalitic(title: title, type: type)
    }
    
}
