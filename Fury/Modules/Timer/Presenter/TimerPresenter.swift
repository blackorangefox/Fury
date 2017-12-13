//
//  ClassicTimerClassicTimerPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

class TimerPresenter: TimerModuleInput, TimerViewOutput {
    
    weak var view: TimerViewInput!
    var router: TimerRouterInput!
    var timerService: TimerServiceProtocol!
    private let formater = DateFormatter()
    var flowStory: TimerStoryProtocol!

    func viewIsReady() {
        view.setupInitialState(type: flowStory.type)
        setupTimer()
    }
    
    func setupTimer() {
        switch flowStory.type {
        case .classic:
            view.createClassicTimer(minuts: 0,
                                    seconds: 0,
                                    miliseconds: 0)
        case .interval:
            if flowStory.restMinuts == 0 && flowStory.restSeconds == 0 {
                view.updateLapsTitle(titles: createTitleWithoutRest(laps: flowStory.sets))
            } else {
                view.updateLapsTitle(titles:createTitleWithRest(laps: flowStory.sets))
            }
            view.createIntervalTimer(sets: flowStory.sets,
                                     workMinuts: flowStory.workMinuts,
                                     workSeconds: flowStory.workSeconds,
                                     restMinuts: flowStory.restMinuts,
                                     restSeconds: flowStory.restSeconds)
        case .countdown:
            view.createCountDownTimer(minuts: flowStory.workMinuts,
                                      seconds: flowStory.workSeconds,
                                      miliseconds: 0)
        }
        if flowStory.type == .interval {
            if flowStory.restMinuts == 0 && flowStory.restSeconds == 0 {
                view.updateLapsTitle(titles: createTitleWithoutRest(laps: flowStory.sets))
            } else {
                view.updateLapsTitle(titles:createTitleWithRest(laps: flowStory.sets))
            }
        }
    }

    func resetButtonPress() {
        view.resetTimer(type: flowStory.type)
        setupTimer()
        view.showPauseButton()
    }
    
    func timerFinish() {
        view.showFinishOrContinueButton()
    }
    
    func pauseButtonPress() {
        view.showFinishOrContinueButton()
    }
    
    func finishButtonPress(with result: String) {
        router.openFinishView(with: result, type: flowStory.type)
    }
    
    func continueButtonPress() {
        view.showPauseButton()
    }
    
    private func createTitleWithoutRest(laps: Int) -> [String] {
        var titleArray: [String] = []
        for index in 1...laps {
            let lapsTitle = "Round" + " \(index)"
            titleArray.append(lapsTitle)
        }
        var lastLapTitle = titleArray.last
        lastLapTitle = "Finish"
        titleArray[titleArray.count-1] = lastLapTitle!
        return titleArray
    }
    
    private func createTitleWithRest(laps: Int) -> [String] {
        var titleArray: [String] = []
        for index in 1...laps {
            let lapsTitle = "Round" + " \(index)"
            let rest = "Rest"
            titleArray.append(lapsTitle)
            titleArray.append(rest)
        }
        titleArray.removeLast()
        var lastLapTitle = titleArray.last
        lastLapTitle = "Finish"
        titleArray[titleArray.count-1] = lastLapTitle!
        return titleArray
    }
}
