//
//  TimerTypeCell.swift
//  Fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

enum TimerType {
    case classic
    case interval
    case countdown
}

class TimerTypeCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    var type: TimerType = .classic

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        let style = TimerStyle(by: type)
        logoImage.image = style.bigLogo
        self.setGradienBackgroundBy(colors: style.gradientColor,
                                    size: CGSize(width: UIScreen.main.bounds.width - 48,
                                                 height: 370))
    }
}
