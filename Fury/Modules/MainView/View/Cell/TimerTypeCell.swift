//
//  TimerTypeCell.swift
//  Fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

class TimerTypeCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    var type: TimerType = .classic
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(TimerTypeCell.rotated),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    override func didMoveToSuperview() {
        let style = TimerStyle(by: type)
        logoImage.image = style.bigLogo
        self.setGradienBackgroundBy(colors: style.gradientColor,
                                    size: CGSize(width: UIScreen.main.bounds.width - 48,
                                                 height: 370))
    }
    
    @objc func rotated() {
        let style = TimerStyle(by: type)
        logoImage.image = style.bigLogo
        self.setGradienBackgroundBy(colors: style.gradientColor,
                                    size: CGSize(width: UIScreen.main.bounds.width - 48,
                                                 height: 370))
    }
}
