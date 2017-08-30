//
//  BottomViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 03/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol BottomViewControllerDelegate: class {
    func letsGoButtonPress()
    func pauseButtonPress()
    func finishButtonPress()
    func continueButtonPress()
}

class BottomCoordinator: UIViewController, RootContainerControllerProtocol, LetsGoViewDelegate, PauseViewDelegate, FinishOrContinueViewDelegate, FinishViewDelegate {
    
    weak var delegate: BottomViewControllerDelegate!
    var letsGoView: LetsGoView!
    var pauseView: PauseView!
    var finishView: FinishView!
    var finishOrContinueView: FinishOrContinueView!
    weak var currentViewController: UIViewController!
    
    override func viewDidLoad() {
        let storyboard = UIStoryboard.init(name: "BottomCoordinator", bundle: nil)
        letsGoView = storyboard.instantiateViewController(withIdentifier: "LetsGoView") as! LetsGoView
        letsGoView.delegate = self
        
        pauseView = storyboard.instantiateViewController(withIdentifier: "PauseView") as! PauseView
        pauseView.delegate = self
        
        finishView = storyboard.instantiateViewController(withIdentifier: "FinishView") as! FinishView
        finishView.delegate = self
        
        finishOrContinueView = storyboard.instantiateViewController(withIdentifier: "FinishOrContinueView") as! FinishOrContinueView
        finishOrContinueView.delegate = self
        
        self.addSubview(letsGoView, container: self.view)
        currentViewController = letsGoView
    }
    
    func showLetGoButton() {
        changeControllerTo(vc: letsGoView)
    }
    
    func showPauseButton() {
       changeControllerTo(vc: pauseView)
    }
    
    func showFinishButton() {
        changeControllerTo(vc: finishView)
    }
    
    func showFinishOrContinueButton() {
        changeControllerTo(vc: finishOrContinueView)
    }
    
    func changeControllerTo(vc: UIViewController) {
        embeddedTransition(oldViewController: currentViewController, toViewController: vc, container: self.view)
        self.currentViewController = vc
    }
    
    //MARK: - LetsGoViewDelegate
    func letsGoButtonPress() {
        self.delegate.letsGoButtonPress()
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
}
