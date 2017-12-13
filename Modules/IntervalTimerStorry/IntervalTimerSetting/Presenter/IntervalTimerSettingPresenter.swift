//
//  IntervalTimerSettingIntervalTimerSettingPresenter.swift
//  fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation
import MediaPlayer

class IntervalTimerSettingPresenter: IntervalTimerSettingModuleInput, IntervalTimerSettingViewOutput, IntervalTimerSettingInteractorOutput {
    
    weak var view: IntervalTimerSettingViewInput!
    var interactor: IntervalTimerSettingInteractorInput!
    var router: IntervalTimerSettingRouterInput!
    var intervalTimerStory: IntervalTimerStoryProtocol!
    
    func viewIsReady() {
        
    }
    
    func letsGoButtonPress(laps: Int, roundTime: String, restTime: String) {
        if roundTime == "00:00" && restTime == "00:00" {
            view.showAler()
        }else {
            let format = DateFormatter()
            format.dateFormat = "mm:ss"
            format.timeZone = TimeZone(abbreviation: "UTC");
            
           // intervalTimerStory.laps = laps
           // intervalTimerStory.roundTime = format.date(from: roundTime)
//intervalTimerStory.restDate = format.date(from: restTime)
            //intervalTimerStory.type = .countdown
            setVolume()
            router.openIntervalTimer()
        }
    }
    
    func setVolume() {
      //  (MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setValue(1, animated: false)
    }
    
    func classicButtonPress() {
        router.openClassicInterval()
    }
    
    func countdownButtonPress() {
        router.openCountdown()
    }
    
}
