//
//  PlayerService.swift
//  Fury
//
//  Created by Mikhail Fokin on 10/07/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import SwiftySound
import AVFoundation
import MediaPlayer

class PlayerService {
    
    init() {
        Sound.enabled = true
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
        
        //(MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setValue(1, animated: false)
    }
    
    func playStartWork() {
        stopAll()
        Sound.play(file: "Airhorn.mp3")
    }
    
    func playStartOrFinisRound() {
        stopAll()
        Sound.play(file: "long-beep.mp3")
    }
    
    func playOneSecond() {
        stopAll()
        Sound.play(file: "1_second.mp3")
    }
    
    private func stopAll() {
        Sound.stopAll()
    }
    
}
