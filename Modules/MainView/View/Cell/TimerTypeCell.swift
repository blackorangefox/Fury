//
//  TimerTypeCell.swift
//  Fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

enum timerType {
    case classic
    case interval
    case countdown
}

class TimerTypeCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    var type: timerType = .classic

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        let gradientLayer = CAGradientLayer()
        switch type {
        case .classic:
            gradientLayer.colors = [UIColor.furyClassicGradientBot.cgColor, UIColor.furyClassicGradientTop.cgColor]
            logoImage.image = UIImage(named: "classic")
        case .interval:
            gradientLayer.colors = [UIColor.furyIntervalGradientTop.cgColor, UIColor.furyIntervalGradientBot.cgColor]
            logoImage.image = UIImage(named: "interval")
        case .countdown:
            gradientLayer.colors = [UIColor.furyCountdownGradientBot.cgColor, UIColor.furyCountdownGradientTop.cgColor]
            logoImage.image = UIImage(named: "countdown")
        }
        gradientLayer.frame.size = CGSize(width: UIScreen.main.bounds.width - 48, height: 370)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
