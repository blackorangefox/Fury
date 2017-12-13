//
//  IntervalTimerSettingIntervalTimerSettingRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class IntervalTimerSettingRouter: IntervalTimerSettingRouterInput, PreStartControllerDelegate {
    
    var viewController : IntervalTimerSettingViewController?
    
    func openClassicInterval() {
        let newView = GlobalAssembly.resolve(type: ClassicTimerViewInput.self) as! UIViewController
        viewController?.present(newView, animated: true, completion: nil)
    }
    
    func openCountdown() {
        
    }
    
    func openIntervalTimer() {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let preScreen  = story.instantiateViewController(withIdentifier: "PreStartController") as! PreStartController
        preScreen.delegate = self
        
    }
    
    func countdownFinish() {
        let intervalTimer = GlobalAssembly.resolve(type: IntervalTimerViewInput.self) as! UIViewController
        viewController?.navigationController?.present(intervalTimer, animated: true)
    }
}
