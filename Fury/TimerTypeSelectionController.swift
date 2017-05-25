//
//  TimerTypeSelectionController.swift
//  Fury
//
//  Created by Mikhail Fokin on 05/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol TimerTypeSelectionControllerDelegate: class {
    func classicButtonPress()
    func intervalButtonPress()
    func countdownButtonPress()
}

class TimerTypeSelectionController: UIViewController {

    @IBOutlet weak var classicButton: UIButton!
    @IBOutlet weak var intervalButton: UIButton!
    @IBOutlet weak var countdownButton: UIButton!
    
    weak var delegate: TimerTypeSelectionControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startConfiguration() {
        classicButton.setTitleColor(UIColor.furyYellowGreen, for: .normal)
        intervalButton.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .normal)
        countdownButton.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .normal)
    }
    
    @IBAction func classicButtonPress(_ sender: Any) {
        self.delegate.classicButtonPress()
        classicButton.setTitleColor(UIColor.furyYellowGreen, for: .normal)
        intervalButton.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .normal)
        countdownButton.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .normal)
    }

    @IBAction func intervalButtonPress(_ sender: Any) {
        self.delegate.intervalButtonPress()
        classicButton.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .normal)
        intervalButton.setTitleColor(UIColor.furyYellowGreen, for: .normal)
        countdownButton.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .normal)
    }
    
    @IBAction func countdownButtonPress(_ sender: Any) {
        self.delegate.countdownButtonPress()
        classicButton.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .normal)
        intervalButton.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .normal)
        countdownButton.setTitleColor(UIColor.furyYellowGreen, for: .normal)
    }
}
