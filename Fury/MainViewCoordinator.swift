//
//  MainViewCoordinator.swift
//  Fury
//
//  Created by Mikhail Fokin on 04/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import SwiftDate

protocol MainViewInputProtocol: class {
    func letsGoButtonPress()
}

protocol MainViewCoordinatorDelegate: class {
    func timerFinish()
    func nextSegment()
    func intervalSetting(laps: Int, isRest: Bool)
}

class MainViewCoordinator: UIViewController, RootContainerControllerProtocol, SettingIntervalMainViewControllerDelegate, TimerViewControllerDelegate, CountdowControllerDelegate, PreStartControllerDelegate {
    
    var timerViewController: TimerViewController!
    var settingIntervalMainViewController: SettingIntervalMainViewController!
    var countdowController: CountdowController!
    weak var currentViewController: MainViewInputProtocol!
    weak var delegate: MainViewCoordinatorDelegate!
    
    private let formater = DateFormatter()
    private var timeArray: [Date] = []
    private var iterator = 0
    //private var timerType: TimerType!
    private let playerService = PlayerService()
    private var isFinishTimer: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formater.dateFormat = "mm:ss:SS"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFinishTimer {
            isFinishTimer = false
            if isNeedShowSurvey() {
                let finishController = self.storyboard?.instantiateViewController(withIdentifier: "SurveyController") as! SurveyController
                self.show(finishController, sender: nil)
            }
        }
      //  openTimeByType(timerType: .classic)
    }
    
    func isNeedShowSurvey() -> Bool {
        if UserDefaults.standard.object(forKey: "AlwaysShowSurvey") != nil {
            return false
        }
        let timeForSurvey: Date = UserDefaults.standard.object(forKey: "TimeForSurvey") as! Date
        let currentDate = Date()
        let diferent = timeForSurvey - currentDate
        if diferent > Double(7.day.in(.second)!) {
            UserDefaults.standard.set(currentDate, forKey: "TimeForSurvey")
            return true
        }
        return false
    }
    
//    public func openTimeByType(timerType: TimerType) {
//        self.timerType = timerType
//        switch timerType {
//        case .interval:
//            showSettingIntervalMainViewController()
//        case .countdown:
//            showCountdowController()
//        default:
//            showTimerController()
//        }
//    }
    
    //MARK: Bottom event
    func letsGoButtonPress() {
        if currentViewController is TimerViewController {
            let time = formater.date(from: "00:00:00")
            //self.startTimer(time: time!, state: .classic)
            return
        }
        self.currentViewController.letsGoButtonPress()
    }
    
    func pauseButtonPress() {
        self.timerViewController.pauseButtonPress()
    }
    
    func continueButtonPress() {
        self.timerViewController.continueButtonPress()
    }
    
    func finishButtonPress() {
//        if timerType == TimerType.classic {
//            let resultController = self.storyboard?.instantiateViewController(withIdentifier: "ResultController") as! ResultController
//            resultController.ruselt = timerViewController.timerLabel.text
//            self.present(resultController, animated: false, completion: nil)
//        } else {
//            let finishController = self.storyboard?.instantiateViewController(withIdentifier: "FinishController") as! FinishController
//            self.present(finishController, animated: false, completion: nil)
//        }
        isFinishTimer = true
    }
    
    //MARK: - SettingIntervalMainViewControllerDelegate
    func createTimerWithParams(laps: Int, lapTime: Date, restTime: Date) {
        iterator = 0
        if restTime.isEmpty(dateFormat: "mm:ss") {
            self.delegate.intervalSetting(laps: laps, isRest: false)
            self.timeArray = createTimeArrayWithoutRest(lapTime: lapTime, laps: laps)
        }else {
            self.delegate.intervalSetting(laps: laps, isRest: true)
            self.timeArray = createTimeArrayWithRest(lapTime: lapTime, laps: laps, restTime: restTime)
        }
        let time = self.timeArray.first!
        iterator = iterator + 1
        //self.startTimer(time: time, state: .countdown)
    }
    
    //MARK: - TimerViewControllerDelegate
    func currentSegmentFinish() {
        if self.iterator < self.timeArray.count {
            let time = self.timeArray[iterator]
            iterator = iterator + 1
          //  self.timerViewController.startWith(time: time, type: .countdown)
            self.delegate.nextSegment()
        }else {
            delegate.timerFinish()
        }
        self.playerService.playStartOrFinisRound()
    }
    
    func lessThen3Second() {
        self.playerService.playOneSecond()
    }
    
    //MARK: - CountdowControllerDelegate
    func setting(time: Date) {
       // self.startTimer(time: time, state: .countdown)
    }
    
    //MARK: - PreStartControllerDelegate
    func countdownFinish() {
        self.playerService.playStartWork()
    }
    
    func left(second: Int) {
        if second <= 3 && second != 0 {
            self.playerService.playOneSecond()
        }
    }
    
    //MARK: - Private
    private func startTimer(time: Date, state: TimerType) {
        self.showTimerController()
        let preScreen  = self.storyboard?.instantiateViewController(withIdentifier: "PreStartController") as! PreStartController
        preScreen.delegate = self
        self.present(preScreen, animated: false) {
            preScreen.startCountdown(10)
//            preScreen.completionBlock = {
//                self.timerType = state
//                self.timerViewController.startWith(time: time, type: state)
//            }
        }
    }
    
    private func showTimerController() {
        timerViewController = self.storyboard?.instantiateViewController(withIdentifier: "TimerViewController") as! TimerViewController
        timerViewController.delegate = self
        timerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(timerViewController)
       // self.addSubview(subView: timerViewController.view, toView: self.view)
        self.currentViewController = timerViewController
    }
    
    private func showSettingIntervalMainViewController() {
        settingIntervalMainViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingIntervalMainViewController") as! SettingIntervalMainViewController
        settingIntervalMainViewController.delegate = self
        settingIntervalMainViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(settingIntervalMainViewController)
        //self.addSubview(subView: self.settingIntervalMainViewController!.view, toView: self.view)
        self.currentViewController = settingIntervalMainViewController
    }
    
    private func showCountdowController() {
        countdowController = self.storyboard?.instantiateViewController(withIdentifier: "CountdowController") as! CountdowController
        countdowController.delegate = self
        countdowController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(countdowController)
        //self.addSubview(subView: self.countdowController!.view, toView: self.view)
        self.currentViewController = countdowController
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
