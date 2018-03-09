//
//  PlayerService.swift
//  Fury
//
//  Created by Mikhail Fokin on 10/07/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import SwiftySound

class PlayerService {
    
    init() {
        Sound.category = .ambient
    }
    
    func playStartWork() {
        Sound.play(file: "Airhorn.mp3")
    }
    
    func playStartOrFinisRound() {
        Sound.play(file: "long-beep.mp3")
    }
    
    func playOneSecond() {
        Sound.play(file: "1_second.mp3")
    }
}
