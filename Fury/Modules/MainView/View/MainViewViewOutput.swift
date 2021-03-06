//
//  MainViewMainViewViewOutput.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol MainViewViewOutput {

    /**
        @author Mikhail Fokin
        Notify presenter that view is ready
    */

    func viewIsReady()
    func openTimer(type: TimerType)
}
