//
//  TimerService.swift
//  Fury
//
//  Created by Mikhail Fokin on 23/07/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import SwiftDate

protocol TimerServiceDelegate {
    func newTime(time: Date)
    func timerFinish()
}

class TimerService: TimerServiceProtocol {
    
    private var timer = Timer()
    private var currenTime : Date!
    private  let format = DateFormatter()
    var delegate: TimerServiceDelegate!
    var aSelector : Selector!
    private var timeOutSleep: Date!
    private var type: TimerType!
    private var isTimerRunning = false
    
    
    func startWith(time: Date, type: TimerType) {
        timer.invalidate()
        self.currenTime = time
        format.dateFormat = "mm:ss:SS"
        self.type = type
        switch type {
        case .countdown, .interval:
            aSelector = #selector(TimerService.updateCountdownTime)
        default:
            aSelector = #selector(TimerService.updateClassicTime)
        }
        isTimerRunning = true
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
    }
    
//    func applicationDidEnterBackground() {
//        if isTimerRunning {
//            let timeToSleep = Date()
//            UserDefaults.standard.set(currenTime, forKey: "currenTime")
//            UserDefaults.standard.set(timeToSleep, forKey: "timeToSleep")
//            print(format.string(from: timeToSleep))
//            timer.invalidate()
//
//        }
//    }
    
//    func applicationDidBecomeActive() {
//        if isTimerRunning {
//
//            let timeToSleep: Date = UserDefaults.standard.object(forKey: "timeToSleep") as! Date
//            self.currenTime = UserDefaults.standard.object(forKey: "currenTime") as! Date
//
//            let timeDidBecome = Date()
//            print("timeToSleep - \(format.string(from: timeToSleep))")
//            print("timeDidBecome - \(format.string(from: timeDidBecome))")
//            print("currenTime - \(format.string(from: currenTime))")
//
//            let difirent = timeDidBecome - timeToSleep
//            switch self.type! {
//            case .countdown, .interval:
//                currenTime.addTimeInterval(-difirent)
//            default:
//                currenTime.addTimeInterval(difirent)
//            }
//            print("new currenTime - \(format.string(from: currenTime))")
//            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
//        }
//    }
     
    func resume() {
        startWith(time: currenTime, type: type)
        self.isTimerRunning = true
    }
    
    
    func pause() {
        timer.invalidate()
        isTimerRunning = false
    }
    
    //MARK: - Private
    
    @objc private func updateCountdownTime() {
        currenTime.addTimeInterval(-0.01)
        if self.format.string(from: currenTime!) == "00:00:00" {
            timer.invalidate()
            isTimerRunning = false
            delegate.timerFinish()
            return
        }
        print("currenTime - \(format.string(from: currenTime))")
        delegate.newTime(time: currenTime)
    }
    
    
    @objc private func updateClassicTime() {
        currenTime.addTimeInterval(0.01)
        delegate.newTime(time: currenTime)
    }
}
