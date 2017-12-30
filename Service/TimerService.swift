//
//  TimerService.swift
//  Fury
//
//  Created by Mikhail Fokin on 22/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation



protocol TimerServiceDelegate: class {
    
}

class TimerService {
    
    weak var delegate: TimerServiceDelegate!

//    func createClassicTimer(minuts: Int = 0, seconds: Int = 0, miliseconds: Int = 0)  {
//        self.timeWhenTimerStart = addingTime(time: Date(), minuts: -minuts, seconds: -seconds, miliseconds: -miliseconds)
//        let aSelector = #selector(TimerViewController.updateClasicTimer)
//        createTimer(selector: aSelector)
//    }
//
//    func createCountDownTimer(minuts: Int, seconds: Int, miliseconds: Int = 0) {
//        countdownTimerStart = Date()
//        self.timeWhenTimerStart = addingTime(time: Date(), minuts: minuts, seconds: seconds, miliseconds: miliseconds)
//        let aSelector = #selector(TimerViewController.updateCountDownTimer)
//        createTimer(selector: aSelector)
//    }
//
//    func createIntervalTimer(sets: Int, workMinuts: Int, workSeconds: Int, restMinuts: Int, restSeconds: Int) {
//        if restSeconds == 0 && restMinuts == 0 {
//            dateMassive = createDateArrayBy(sets: sets,
//                                            workMinuts: workMinuts,
//                                            workSeconds: workSeconds)
//        } else {
//            dateMassive = createDateArrayBy(sets: sets,
//                                            workMinuts: workMinuts,
//                                            workSeconds: workSeconds,
//                                            restMinuts: restMinuts,
//                                            restSeconds: restSeconds)
//        }
//        self.timeWhenTimerStart = dateMassive[currentIndex]
//        let aSelector = #selector(TimerViewController.updateIntervalTimer)
//        createTimer(selector: aSelector)
//    }
}
