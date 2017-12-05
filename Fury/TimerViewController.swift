//
//  TimerViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 04/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import Foundation

protocol TimerViewControllerDelegate: class {
    func currentSegmentFinish()
    func lessThen3Second()
}

class TimerViewController: UIViewController, MainViewInputProtocol, TimerServiceDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    public  let format = DateFormatter()
    public var delegate: TimerViewControllerDelegate!
    private var timerService: TimerServiceProtocol!
    private var playerService: PlayerService = PlayerService()
    //private var type: TimerType = .classic
    
    override func viewDidLoad() {
        super.viewDidLoad()
        format.dateFormat = "mm:ss:SS"
        timerService = GlobalAssembly.resolve(type: TimerServiceProtocol.self)
        timerService.delegate = self
    }
    
    //MARK: - MainViewInputProtocol
    public func letsGoButtonPress() {
        //let time = format.date(from: "00:00:00")
       // startWith(time: time!, type: .classic)
    }
    
//    func startWith(time: Date, type: TimerType) {
//        timerService.startWith(time: time, type: type)
//        self.type = type 
//        timerLabel.textColor = UIColor.furyYellowGreen
//    }
    
    public func continueButtonPress() {
        timerService.resume()
    }
    
    public func pauseButtonPress() {
        timerService.pause()
    }
    
    //MARK TimerServiceDelegate
    func newTime(time: Date) {
        let timeForString  = self.format.string(from: time)
//        if self.type != .classic {
//            if timeForString == "00:01:99" || timeForString == "00:02:99" || timeForString == "00:03:99" {
//                playerService.playOneSecond()
//            }
//        }
        timerLabel.text = format.string(from: time)
    }
    
    func timerFinish() {
        timerLabel.text = "00:00:00"
        playerService.playStartOrFinisRound()
        delegate.currentSegmentFinish()
    }
}
