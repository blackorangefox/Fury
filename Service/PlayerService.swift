//
//  PlayerService.swift
//  Fury
//
//  Created by Mikhail Fokin on 10/07/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerService {
    
    var songPlayer : AVAudioPlayer?
    
    func playStartWork() {
        self.playSound(name: "Airhorn", loop: 0)
    }
    
    func playStartOrFinisRound() {
        self.playSound(name: "long-beep", loop: 0)
    }
    
    func playOneSecond() {
        self.playSound(name: "1_second", loop: 0)
    }
    
    private func playSound(name: String, loop: Int) {
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSessionCategoryPlayback, with: [AVAudioSessionCategoryOptions.mixWithOthers]) //Causes audio from other sessions to be ducked (reduced in volume) while audio from this session plays
        try! audioSession.setActive(true)
        //
        if let path = Bundle.main.path(forResource: name, ofType: "mp3") {
            let filePath = NSURL(fileURLWithPath:path)
            songPlayer = try! AVAudioPlayer.init(contentsOf: filePath as URL)
            songPlayer?.volume = 1.0
            songPlayer?.numberOfLoops = loop
            songPlayer?.prepareToPlay()
            songPlayer?.play()
        }
    }
    
    
}
