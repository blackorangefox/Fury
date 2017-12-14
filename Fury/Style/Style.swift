//
//  Style.swift
//  Fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

struct TimerStyle {
    var gradientColor: [Any]
    var mainColor: UIColor
    var bigLogo: UIImage
    var smallLogo: UIImage
    var type: TimerType
    var subTitle: String
    
    init(by type: TimerType) {
        self.type = type
        switch type {
        case .classic:
            gradientColor = [UIColor.furyClassicGradientBot.cgColor, UIColor.furyClassicGradientTop.cgColor]
            mainColor = UIColor.furyPinkRed
            bigLogo = UIImage(named: "classic")!
            smallLogo = UIImage(named: "classicSmall")!
            subTitle = "MY RESULT"
        case .interval:
            gradientColor = [UIColor.furyIntervalGradientTop.cgColor, UIColor.furyIntervalGradientBot.cgColor]
            mainColor = UIColor.furyGoldenYellow
            bigLogo = UIImage(named: "interval")!
            smallLogo = UIImage(named: "intervalSmall")!
            subTitle = "MY RESULT"
        case .countdown:
            gradientColor = [UIColor.furyCountdownGradientBot.cgColor, UIColor.furyCountdownGradientTop.cgColor]
            mainColor = UIColor.furyBrightLavender
            bigLogo = UIImage(named: "countdown")!
            smallLogo = UIImage(named: "countdownSmall")!
            subTitle = "COMPLETED"
        }
    }
}
