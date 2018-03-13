//
//  PreStartController.swift
//  Fury
//
//  Created by Mikhail Fokin on 16/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import SwiftySound


final class PreStartController: UIViewController {
    
    
    private var items: [String] = ["GO",
                                   "1",
                                   "2",
                                   "3",
                                   "4",
                                   "5",
                                   "6",
                                   "7",
                                   "8",
                                   "9",
                                   "10"]
    private var currentIndex = 0
    private var timer: Timer!
    var style: TimerStyle!
    
    private let playerService = PlayerService()
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bottomGradientViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentIndex = items.count-1
        showInformationViewIfNeeded()
        subscribeScreenRotate()
    }
    
    func subscribeScreenRotate() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PreStartController.rotated),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createTimer()
        
    }
    
    @objc func updateSelectCell() {
        var backgroundTask = UIApplication.shared.beginBackgroundTask()
        self.currentIndex -= 1
        countdownLabel.pushTransition(0.5)
        countdownLabel.text = items[currentIndex]
        switch currentIndex {
        case 3,2,1:
            playerService.playOneSecond()
            Logger.log(message: "default playOneSecond", event: .i)
        case 0:
            playerService.playStartWork()
            closeButtonPress(self)
            timer.invalidate()
            let vc = GlobalAssembly.resolve(type: TimerViewInput.self) as! UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
            Logger.log(message: "default playStartWork", event: .i)
        default:
            Logger.log(message: "default " + currentIndex.description, event: .i)
        }
        if backgroundTask != UIBackgroundTaskInvalid {
            if UIApplication.shared.applicationState == .active {
                UIApplication.shared.endBackgroundTask(backgroundTask)
                backgroundTask = UIBackgroundTaskInvalid
            }
        }
    }
    
    @IBAction func closeButtonPress(_ sender: Any) {
        bottomGradientViewConstraint.constant = -600
        UIView.animate(withDuration: 0.3) {
            self.gradientView.layoutIfNeeded()
        }
        UserDefaults.standard.set(true, forKey: "alreadyShown")
    }
    
    @objc func rotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            closeButtonPress(self)
        }
    }
    
    private func showInformationViewIfNeeded() {
        if !UserDefaults.standard.bool(forKey: "alreadyShown") {
            bottomGradientViewConstraint.constant = 24
            UIView.animate(withDuration: 0.3) {
                self.gradientView.layoutIfNeeded()
            }
        } else {
            bottomGradientViewConstraint.constant = -600
        }
    }
    
    private func createTimer() {
        let aSelector = #selector(PreStartController.updateSelectCell)
        timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: aSelector,
                                          userInfo: nil,
                                          repeats: true)
        let mainRunLoop = RunLoop()
        mainRunLoop.add(timer, forMode: .defaultRunLoopMode)
    }

}

extension UIView {
    func pushTransition(_ duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromBottom
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionPush)
    }
}

