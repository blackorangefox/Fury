//
//  TimerViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 04/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import Foundation

enum TimerState {
    case CLASSIC
    case COUNTDOWN
}

protocol TimerViewControllerDelegate: class {
    func currentSegmentFinish()
}

class TimerViewController: UIViewController, MainViewInputProtocol {
    @IBOutlet weak var timerLabel: UILabel!
    private var timer = Timer()
    private var isTimerRunning = false
    private var resumeTapped = false

    public  var startTime : Date!
    public  let format = DateFormatter()
    public var state: TimerState = .CLASSIC
    public var delegate: TimerViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        format.dateFormat = "mm:ss:SS"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - MainViewInputProtocol
    public func letsGoButtonPress() {
        let time = format.date(from: "00:00:00")
        state = .CLASSIC
        startWith(time: time!)
    }

    public func startWith(time: Date) {
        self.startTime = time
        timerLabel.text = format.string(from: startTime!)
        var aSelector : Selector
        switch state {
            case .COUNTDOWN:
                aSelector = #selector(TimerViewController.updateCountdownTime)
            default:
                aSelector = #selector(TimerViewController.updateClassicTime)
        }

        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        isTimerRunning = true
        timerLabel.textColor = UIColor.furyYellowGreen
    }
    
    public func continueButtonPress() {
        self.pauseButtonPress()
    }
    
    public func pauseButtonPress() {
        if self.resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        } else {
            startWith(time: startTime)
            self.resumeTapped = false
        }
    }

    //MARK: - Private
    @objc private func updateCountdownTime() {
        startTime = startTime! - 0.01
        timerLabel.text = format.string(from: startTime)
        if self.format.string(from: startTime!) == "00:00:00" {
            timer.invalidate()
            delegate.currentSegmentFinish()
        }
    }
    
    @objc private func updateClassicTime() {
        startTime = startTime! + 0.01
        timerLabel.text = format.string(from: startTime!)
    }

}
