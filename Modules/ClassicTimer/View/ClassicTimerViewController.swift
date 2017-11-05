//
//  ClassicTimerClassicTimerViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import UserNotifications

class ClassicTimerViewController: UIViewController, RootContainerControllerProtocol, ClassicTimerViewInput, BottomViewControllerDelegate {
    
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var output: ClassicTimerViewOutput!
    var bottomViewController: BottomCoordinator!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        timeLabel.adjustsFontSizeToFitWidth = true
        setBottonView()
        timeLabel.sizeToFit()
    }
    
    func setBottonView() {
        let storyboard = UIStoryboard.init(name: "BottomCoordinator", bundle: nil)
        bottomViewController = storyboard.instantiateViewController(withIdentifier: "BottomViewController") as! BottomCoordinator
        bottomViewController.delegate = self
        self.addSubview(self.bottomViewController, container: bottomContainer)
    }
        
    // MARK: ClassicTimerViewInput
    func setupInitialState() {
    }
    
    func newTime(time: String) {
        timeLabel.text = time
    }
    
    func showLetGoButton() {
        timeLabel.text = "00:00:00"
        bottomViewController.showLetGoButton()
    }
    
    func showPauseButton() {
        bottomViewController.showPauseButton()
    }
    
    func showFinishButton() {
        bottomViewController.showFinishButton()
    }
    
    func showFinishOrContinueButton() {
        bottomViewController.showFinishOrContinueButton()
    }
    
    // MARK: BottomViewControllerDelegate
    func letsGoButtonPress() {
        output.letsGoButtonPress()
    }
    
    func pauseButtonPress() {
        output.pauseButtonPress()
    }
    
    func finishButtonPress() {
        output.finishButtonPress(with: timeLabel.text!)
    }
    
    func continueButtonPress() {
        output.continueButtonPress()
    }
    
    func resetButtonPress() {
        output.resetButtonPress()
    }
}
