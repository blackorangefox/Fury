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

final class SoundService {
    
    private var secondSound: Sound?
    private var airhornSound: Sound?
    private var long_beepSound: Sound?
    
    private let secondUrl = Bundle.main.url(forResource: "1_second", withExtension: "mp3")
    private let airhornUrl = Bundle.main.url(forResource: "Airhorn", withExtension: "mp3")
    private let long_beepUrl = Bundle.main.url(forResource: "long-beep", withExtension: "mp3")
    
    init() {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: .mixWithOthers)
            print("Playback OK")
            try AVAudioSession.sharedInstance().setActive(true)
            print("Session is Active")
        } catch {
            print(error)
        }
        
        secondSound = Sound(url: secondUrl!)
        airhornSound = Sound(url: airhornUrl!)
        long_beepSound = Sound(url: long_beepUrl!)
    }
    
    func playStartWork() {
        stopSound()
        guard let sound = airhornSound else {
            Logger.log(message: "airhornSound doesn't init", event: .e)
            return
        }
        let isMainThread = Thread.isMainThread
        Logger.log(message: isMainThread ? "main thred" : "other thred", event: isMainThread ? .i : .e)
        let result = sound.play(numberOfLoops: 0) { (flag) in
            Logger.log(message: "finish play Airhorn", event: .i)
        }
        Logger.log(message: result ? "Airhorn start work" : "can't play Airhorn", event: result ? .i : .e)
        print("\n")
    }
    
    func playStartOrFinisRound() {
        stopSound()
        guard let sound = long_beepSound else {
            Logger.log(message: "long-beep doesn't init", event: .e)
            return
        }
        let isMainThread = Thread.isMainThread
        Logger.log(message: isMainThread ? "main thred" : "other thred", event: isMainThread ? .i : .e)
        let result = sound.play(numberOfLoops: 0) { (flag) in
            Logger.log(message: "finish play long-beep", event: .i)
        }
        Logger.log(message: result ? "long-beep work" : "can't play long-beep", event: result ? .i : .e)
        print("\n")
    }
    
    func playOneSecond() {
        stopSound()
        guard let sound = secondSound else {
            Logger.log(message: "1_second doesn't init", event: .e)
            return
        }
        let isMainThread = Thread.isMainThread
        Logger.log(message: isMainThread ? "main thred" : "other thred", event: isMainThread ? .i : .e)
        let result = sound.play(numberOfLoops: 0) { (flag) in
            Logger.log(message: "finish play 1_second work", event: .i)
        }
        Logger.log(message: result ? "1_second work" : "can't play 1_second", event: result ? .i : .e)
        print("\n")
    }
    
    private func stopSound() {
        secondSound?.stop()
        airhornSound?.stop()
        long_beepSound?.stop()
    }
    
    private func setVolumeMax() {
        secondSound?.volume = 1.0
        airhornSound?.volume = 1.0
        long_beepSound?.volume = 1.0
    }
    
}
