//
//  IntervalTimerIntervalTimerPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 18/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class IntervalTimerPresenter: IntervalTimerModuleInput, IntervalTimerViewOutput, IntervalTimerInteractorOutput, TimerServiceDelegate {
    
    weak var view: IntervalTimerViewInput!
    var interactor: IntervalTimerInteractorInput!
    var router: IntervalTimerRouterInput!
    var intervalTimerStory: IntervalTimerStoryProtocol!
    var timerService: TimerServiceProtocol!
    private var timeArray: [Date] = []
    private var counter: Int = 0
    
    func viewIsReady() {
        let isRest = !intervalTimerStory.restDate.isEmpty(dateFormat: "mm:ss")
        let laps = intervalTimerStory.laps!
        if isRest {
            view.updateLapsTitle(titles: createTitleWithRest(laps: laps))
            timeArray = createTimeArrayWithRest(lapTime: intervalTimerStory.roundTime, laps: laps, restTime: intervalTimerStory.restDate)
        }else {
            view.updateLapsTitle(titles: createTitleWithoutRest(laps: laps))
            timeArray = createTimeArrayWithoutRest(lapTime: intervalTimerStory.roundTime, laps: laps)
        }
        
        //timerService.startWith(time: intervalTimerStory.roundTime, type: intervalTimerStory.type)
        timerService.delegate = self
    }
    
    func pauseButtonPress() {
        timerService.pause()
    }
    
    func continuePress() {
        timerService.resume()
    }
    
    func finishButton() {
        router.closeView()
    }
    
    //MARK - TimerServiceDelegate
    
    func timerFinish() {
        counter += 1
        view.newTime(time: "00:00:00")
        if counter < timeArray.count {
            let time = self.timeArray[counter]
         //   timerService.startWith(time: time, type: .countdown)
            view.nextSegment()
        }else {
            view.timerFinish()
        }
    }
    
    func newTime(time: Date) {
        let format = DateFormatter()
        format.dateFormat = "mm:ss:SS"
        let timeForString = format.string(from: time)
        view.newTime(time: timeForString)
        updateLine(time: time)
    }
    
    func updateLine(time: Date) {
        let format = DateFormatter()
        format.dateFormat = "mmssSS"
        format.timeZone = TimeZone(abbreviation: "UTC");
        
        let timeLaps = Double(format.string(from: timeArray[counter]))
        let currentTime = Double(format.string(from: time))
        
        let a = Double(timeArray[counter].timeIntervalSince1970)
        let a1 =  String(format: "%07d", a)
        let a2 = Int(a1)
        
        let b = Double(time.timeIntervalSince1970)
        let b1 =  String(format: "%07d", b)
        let b2 = Int(b1)
        
       // let persent = 100 - Int((a2!*100)/b2!)
       // let lenghtPersent = UIScreen.main.bounds.width*CGFloat(persent)/CGFloat(100)
       // view.updateLine(width: lenghtPersent)
    }
    
    
    //MARK - Private
    private func createTitleWithoutRest(laps: Int) -> [String] {
        var titleArray: [String] = []
        for index in 1...laps {
            let lapsTitle = "LAP" + " \(index)"
            titleArray.append(lapsTitle)
        }
        var lastLapTitle = titleArray.last
        lastLapTitle = "FINISH"
        titleArray[titleArray.count-1] = lastLapTitle!
        return titleArray
    }
    
    private func createTitleWithRest(laps: Int) -> [String] {
        var titleArray: [String] = []
        for index in 1...laps {
            let lapsTitle = "LAP" + " \(index)"
            let rest = "REST"
            titleArray.append(lapsTitle)
            titleArray.append(rest)
        }
        titleArray.removeLast()
        var lastLapTitle = titleArray.last
        lastLapTitle = "FINISH"
        titleArray[titleArray.count-1] = lastLapTitle!
        return titleArray
    }
    
    private func createTimeArrayWithRest(lapTime: Date, laps: Int,  restTime: Date) -> [Date] {
        var timeArray : [Date] = []
        for _ in 0..<laps {
            timeArray.append(lapTime)
            timeArray.append(restTime)
        }
        timeArray.removeLast()
        return timeArray
    }
    
    private func createTimeArrayWithoutRest(lapTime: Date, laps: Int) -> [Date] {
        var timeArray : [Date] = []
        for _ in 0..<laps {
            timeArray.append(lapTime)
        }
        return timeArray
    }
}
