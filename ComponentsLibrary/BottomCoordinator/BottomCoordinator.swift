//
//  BottomViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 03/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol BottomViewControllerDelegate: class {
    func pauseButtonPress()
    func finishButtonPress()
    func continueButtonPress()
    func resetButtonPress()
}

class BottomCoordinator: UIViewController, PauseViewDelegate, FinishOrContinueViewDelegate {
 
    weak var delegate: BottomViewControllerDelegate!
    var pauseView: PauseView!
    var finishOrContinueView: FinishOrContinueView!
    weak var currentViewController: UIViewController!
    var type: TimerType = .classic
    
    override func viewDidLoad() {
        let storyboard = UIStoryboard.init(name: "BottomCoordinator", bundle: nil)
        
        pauseView = storyboard.instantiateViewController(withIdentifier: "PauseView") as! PauseView
        pauseView.delegate = self
        pauseView.type = type
        
        finishOrContinueView = storyboard.instantiateViewController(withIdentifier: "FinishOrContinueView") as! FinishOrContinueView
        finishOrContinueView.delegate = self
        finishOrContinueView.type = type
        
        self.addSubview(pauseView, container: self.view)
        currentViewController = pauseView
    }
    
    func showPauseButton() {
       changeControllerTo(vc: pauseView)
    }
    
    func showFinishOrContinueButton() {
        changeControllerTo(vc: finishOrContinueView)
    }
    
    func changeControllerTo(vc: UIViewController) {
        embeddedTransition(oldViewController: currentViewController, toViewController: vc, container: self.view)
        self.currentViewController = vc
    }
    
    //MARK: - PauseViewDelegate
    func pauseButtonPress() {
        self.delegate.pauseButtonPress()
    }
    
    //MARK: - FinishOrContinueViewDelegate && FinishViewDelegate
    func finishButtonPress() {
        self.delegate.finishButtonPress()
    }
    
    func continueButtonPress() {
        self.delegate.continueButtonPress()
    }
    
    func resetButtonPress() {
        self.delegate.resetButtonPress()
    }
    
}
