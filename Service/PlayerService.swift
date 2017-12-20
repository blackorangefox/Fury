//
//  PlayerService.swift
//  Fury
//
//  Created by Mikhail Fokin on 10/07/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import AVFoundation
import MediaPlayer

class PlayerService {
    
    var startWork : AVAudioPlayer
    var oneSecondPlayer: AVAudioPlayer
    var startOrFinisRoundPlayer: AVAudioPlayer
    
    init() {
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSessionCategoryPlayback, with: [AVAudioSessionCategoryOptions.mixWithOthers]) //Causes audio from other sessions to be ducked (reduced in volume) while audio from this session plays
        try! audioSession.setActive(true)
        
        let path_1 = Bundle.main.path(forResource: "Airhorn", ofType: "mp3")
        let filePath_1 = NSURL(fileURLWithPath: path_1!)
        startWork = try! AVAudioPlayer.init(contentsOf: filePath_1 as URL)
        startWork.volume = 1.0
        startWork.numberOfLoops = 0
        startWork.prepareToPlay()
        
        let path_2 = Bundle.main.path(forResource: "long-beep", ofType: "mp3")
        let filePath_2 = NSURL(fileURLWithPath: path_2!)
        startOrFinisRoundPlayer = try! AVAudioPlayer.init(contentsOf: filePath_2 as URL)
        startOrFinisRoundPlayer.volume = 1.0
        startOrFinisRoundPlayer.numberOfLoops = 0
        startOrFinisRoundPlayer.prepareToPlay()
        
        let path_3 = Bundle.main.path(forResource: "1_second", ofType: "mp3")
        let filePath_3 = NSURL(fileURLWithPath: path_3!)
        oneSecondPlayer = try! AVAudioPlayer.init(contentsOf: filePath_3 as URL)
        oneSecondPlayer.volume = 1.0
        oneSecondPlayer.numberOfLoops = 0
        oneSecondPlayer.prepareToPlay()
    }
    
    
    func playStartWork() {
        startWork.play()
    }
    
    func playStartOrFinisRound() {
        startOrFinisRoundPlayer.play()
    }
    
    func playOneSecond() {
        oneSecondPlayer.play()
    }
    
//    private func playSound(name: String, loop: Int) {
//        //(MPVolumeView().subviews.filter{NSStringFromClass($0.classForCoder) == "MPVolumeSlider"}.first as? UISlider)?.setValue(1, animated: false)
//        if let path = Bundle.main.path(forResource: name, ofType: "mp3") {
//            let filePath = NSURL(fileURLWithPath: path)
//            songPlayer = try! AVAudioPlayer.init(contentsOf: filePath as URL)
//            songPlayer?.volume = 1.0
//            songPlayer?.numberOfLoops = loop
//            songPlayer?.prepareToPlay()
//            songPlayer?.play()
//        }
//    }
    
    
}
