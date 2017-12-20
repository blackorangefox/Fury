//
//  ClassicTimerClassicTimerViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import UserNotifications
import SwifterSwift
import SwiftDate
import Mixpanel

class TimerViewController: UIViewController, TimerViewInput {
    
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var colectionView: UICollectionView!
    
    var output: TimerViewOutput!
    var bottomViewController: BottomCoordinator!
    
    var timer: Timer!
    var timeWhenTimerStart = Date()
    var currentIndex = 0
    var dateMassive: [Date] = []
    var timeWhenPausePress = Date()
    var titleArray: [String] = []
    var type: TimerType = .classic
    var countdownTimerStart = Date()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        colectionView.dataSource = self
        colectionView.delegate = self
        let increment = IndexPath(row: 0, section: 0)
        colectionView.performBatchUpdates(nil) { _ in
            self.collectionView(self.colectionView, didSelectItemAt: increment)
        }
    }
        
    func showPauseButton() {
        bottomViewController.showPauseButton()
    }
    
    func showFinishOrContinueButton() {
        bottomViewController.showFinishOrContinueButton()
    }
    
    func createClassicTimer(minuts: Int = 0, seconds: Int = 0, miliseconds: Int = 0)  {
        self.timeWhenTimerStart = addingTime(time: Date(), minuts: -minuts, seconds: -seconds, miliseconds: -miliseconds)
        let aSelector = #selector(TimerViewController.updateClasicTimer)
        createTimer(selector: aSelector)
    }
    
    func createCountDownTimer(minuts: Int, seconds: Int, miliseconds: Int = 0) {
        countdownTimerStart = Date()
        self.timeWhenTimerStart = addingTime(time: Date(), minuts: minuts, seconds: seconds, miliseconds: miliseconds)
        let aSelector = #selector(TimerViewController.updateCountDownTimer)
        createTimer(selector: aSelector)
    }
    
    func createIntervalTimer(sets: Int, workMinuts: Int, workSeconds: Int, restMinuts: Int, restSeconds: Int) {
        if restSeconds == 0 && restMinuts == 0 {
            dateMassive = createDateArrayBy(sets: sets,
                                            workMinuts: workMinuts,
                                            workSeconds: workSeconds)
        } else {
            dateMassive = createDateArrayBy(sets: sets,
                                            workMinuts: workMinuts,
                                            workSeconds: workSeconds,
                                            restMinuts: restMinuts,
                                            restSeconds: restSeconds)
        }
        self.timeWhenTimerStart = dateMassive[currentIndex]
        let aSelector = #selector(TimerViewController.updateIntervalTimer)
        createTimer(selector: aSelector)
    }
    
    @objc func updateIntervalTimer() {
        let newTime = timeWhenTimerStart - Date()
        if newTime <= 0 {
            timeLabel.text = "00:00:00"
            currentIndex += 1
            nextSegment()
            if currentIndex == dateMassive.count {
                pauseButtonPress()
                return
            }
            self.timeWhenTimerStart = dateMassive[currentIndex]
            return
        }
        updateLabel(newTime: newTime)
    }
    
    func nextSegment() {
        let oldIndexpath = IndexPath(row: currentIndex-1, section: 0)
        self.collectionView(colectionView, didDeselectItemAt: oldIndexpath)
        let increment = IndexPath(row: currentIndex, section: 0)
        colectionView.layoutIfNeeded()
        colectionView.scrollToItem(at: increment, at: .centeredHorizontally, animated: true)
        self.collectionView(colectionView, didSelectItemAt: increment)
    }
    
    @objc func updateClasicTimer() {
        let newTime = Date().timeIntervalSince(timeWhenTimerStart)
        updateLabel(newTime: newTime)
    }
    
    @objc func updateCountDownTimer() {
        let newTime = timeWhenTimerStart - Date()
        if newTime <= 0 {
            timeLabel.text = "00:00:00"
            pauseButtonPress()
            return
        }
        updateLabel(newTime: newTime)
    }
    
    func stopTimer() {
        guard let tr = self.timer else {
            return
        }
        tr.invalidate()
    }
    
    func pauseTimer() {
        stopTimer()
    }
    
    func resetTimer(type: TimerType) {
        timeWhenTimerStart = Date()
        currentIndex = 0
        dateMassive = []
        if type == .interval {
            let increment = IndexPath(row: 0, section: 0)
            colectionView.layoutIfNeeded()
            colectionView.scrollToItem(at: increment, at: .centeredHorizontally, animated: true)
        }
    }
    
    // MARK: ClassicTimerViewInput
    func setupInitialState(type: TimerType) {
        self.type = type
        setBottonView(type: type)
    }
    
    func setBottonView(type: TimerType) {
        let storyboard = UIStoryboard.init(name: "BottomCoordinator", bundle: nil)
        bottomViewController = storyboard.instantiateViewController(withIdentifier: "BottomViewController") as! BottomCoordinator
        bottomViewController.type = type
        bottomViewController.delegate = self
        self.addSubview(self.bottomViewController, container: bottomContainer)
    }
    
    func updateLapsTitle(titles: [String]) {
        titleArray = titles
        colectionView.reloadData()
    }
    
    func newTime(time: String) {
        timeLabel.text = time
    }
    
    
    
    //MARK: PRIVATE
    private func continueCountDownTimer() {
        let time = timeOnScreen()
        createCountDownTimer(minuts: time.minuts, seconds: time.seconds, miliseconds: time.miliseconds)
    }
    
    private func continueClassicTimer() {
        let time = timeOnScreen()
        createClassicTimer(minuts: time.minuts, seconds: time.seconds, miliseconds: time.miliseconds)
    }
    
    private func continueIntervalTimer() {
        let newTime = Date() - timeWhenPausePress
        let time = getTimeBy(newTime: newTime)
        for index in currentIndex..<dateMassive.count {
            dateMassive[index] = addingTime(time: dateMassive[index], minuts: time.minuts, seconds: time.seconds, miliseconds: time.miliseconds*100)
        }
        self.timeWhenTimerStart = addingTime(time: timeWhenTimerStart, minuts: time.minuts, seconds: time.seconds, miliseconds: time.miliseconds*100)
        let aSelector = #selector(TimerViewController.updateIntervalTimer)
        createTimer(selector: aSelector)
    }
    
    private func timeOnScreen() -> (minuts: Int, seconds: Int, miliseconds: Int) {
        let timerString = self.timeLabel.text
        var fullTimeArr = timerString?.components(separatedBy: ":")
        let minuts = Int(fullTimeArr![0])
        let seconds = Int(fullTimeArr![1])
        let miliseconds = Int(fullTimeArr![2]+"00")
        return (minuts!, seconds!, miliseconds!)
    }
    
    private func addingTime(time: Date, minuts: Int, seconds: Int, miliseconds: Int) -> Date {
        var newDate = time.adding(.minute, value: minuts)
        newDate = newDate.adding(.second, value: seconds)
        newDate = newDate.adding(.nanosecond, value: miliseconds*100000)
        return newDate
    }
    
    private func updateLabel(newTime: TimeInterval) {
        let time = getTimeBy(newTime: newTime)
        timeLabel.text = String(format: "%02d:%02d:%02d", time.minuts, time.seconds, time.miliseconds)
        print(timeLabel.text!)
    }
    
    private func getTimeBy(newTime: TimeInterval) -> (minuts: Int, seconds: Int, miliseconds: Int) {
        let minuts = Int(newTime) / 60 % 60
        let seconds = Int(newTime) % 60
        let miliseconds = Int(((newTime.truncatingRemainder(dividingBy: 1)) * 1000)/10)
        return (minuts, seconds, miliseconds)
    }
    
    private func createDateArrayBy(sets: Int, workMinuts: Int, workSeconds: Int, restMinuts: Int, restSeconds: Int) -> [Date] {
        var array: [Date] = []
        array.append(Date())
        for index in 1...sets {
            if index % 2 == 0 {
                var newDate = array.last!.adding(.minute, value: restMinuts)
                newDate = newDate.adding(.second, value: restSeconds)
                array.append(newDate)
            }else {
                var newDate = array.last!.adding(.minute, value: workMinuts)
                newDate = newDate.adding(.second, value: workSeconds)
                array.append(newDate)
            }
        }
        array.remove(at: 0)
        return array
    }
    
    private func createDateArrayBy(sets: Int, workMinuts: Int, workSeconds: Int) -> [Date] {
        var array: [Date] = []
        array.append(Date())
        for _ in 1...sets {
            var newDate = array.last!.adding(.minute, value: workMinuts)
            newDate = newDate.adding(.second, value: workSeconds)
            array.append(newDate)
        }
        array.remove(at: 0)
        return array
    }
    
    private func createTimer(selector: Selector) {
        self.timer = Timer.scheduledTimer(timeInterval: 0.01,
                                          target: self,
                                          selector: selector,
                                          userInfo: nil,
                                          repeats: true)
    }
}

extension TimerViewController: BottomViewControllerDelegate {
    
    func pauseButtonPress() {
        stopTimer()
        timeWhenPausePress = Date()
        print("---PAUSE---")
        output.pauseButtonPress()
    }
    
    func finishButtonPress() {
        stopTimer()
        Mixpanel.mainInstance().track(event: "FINISH press")
        switch type {
        case .classic:
            output.finishButtonPress(with: timeLabel.text ?? "00:00:00")
        case .interval:
            output.finishButtonPress(with: "\(currentIndex) RNDS")
        case .countdown:
            let time = getTimeBy(newTime: timeWhenPausePress.timeIntervalSince(countdownTimerStart))
            output.finishButtonPress(with: String(format: "%02d:%02d:%02d", time.minuts, time.seconds, time.miliseconds))
        }
    }
    
    func continueButtonPress() {
        print("---CONTINEU---")
        switch type {
            case .classic:
                continueClassicTimer()
            case .interval:
                continueIntervalTimer()
            case .countdown:
                continueCountDownTimer()
        }
        Mixpanel.mainInstance().track(event: "continue press")
        output.continueButtonPress()
    }
    
    func resetButtonPress() {
        Mixpanel.mainInstance().track(event: "RESET press")
        stopTimer()
        output.resetButtonPress()
    }
}

extension TimerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int  {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntervalNavigationCell", for: indexPath) as! IntervalNavigationCell
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.titleLabel.textColor = UIColor.lightText
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? IntervalNavigationCell
        cell?.titleLabel.textColor = UIColor.white
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? IntervalNavigationCell
        cell?.titleLabel.textColor = UIColor.lightText
    }
}
