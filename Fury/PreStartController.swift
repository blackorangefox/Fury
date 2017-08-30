//
//  PreStartController.swift
//  Fury
//
//  Created by Mikhail Fokin on 16/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
protocol PreStartControllerDelegate: class {
    func countdownFinish()
}

class PreStartController: UIViewController {
    
    weak var delegate: PreStartControllerDelegate!
    
    @IBOutlet weak var numberLabel: UILabel!
    private let playerService = PlayerService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startCountdown(_ count: Int) {
        animateWithString(count)
    }
    
    func animateWithString(_ count: Int) {
        if count == 0 {
            numberLabel.text = "GO"
            self.playerService.playStartWork()
        }else {
            numberLabel.text = "\(count)"
            playMusic(count)
        }
        
        numberLabel.transform = numberLabel.transform.scaledBy(x: 0.5, y: 0.5);
        numberLabel.contentScaleFactor = 1
        UIView.animate(withDuration: 1.0, animations: {
            self.numberLabel.transform = self.numberLabel.transform.scaledBy(x: 3, y: 3);
        }) { (complition) in
            if complition {
                if self.numberLabel.text == "GO" {
                    self.removeFromSuperview()
                    return
                }
                self.numberLabel.transform = CGAffineTransform.identity
                self.animateWithString(count - 1)
            }
        }
    }
    
    func playMusic(_ count: Int) {
        if count <= 3 && count != 0 {
            self.playerService.playOneSecond()
        }
    }
    
    func removeFromSuperview() {
        self.dismiss(animated: false, completion: {
            self.delegate.countdownFinish()
        })
    }
}
