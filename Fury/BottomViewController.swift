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

class BottomCoordinator: RootContainerController, LetsGoViewDelegate, PauseViewDelegate, FinishOrContinueViewDelegate, FinishViewDelegate {
    
    weak var delegate: BottomViewControllerDelegate!
    var letsGoView: LetsGoView!
    var pauseView: PauseView!
    var finishView: FinishView!
    var finishOrContinueView: FinishOrContinueView!
    weak var currentViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        startConfiguration()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startConfiguration() {
        letsGoView = self.storyboard?.instantiateViewController(withIdentifier: "LetsGoView") as! LetsGoView
        letsGoView.delegate = self
        letsGoView.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(letsGoView)
        self.addSubview(subView: self.letsGoView!.view, toView: self.view)
        self.currentViewController = letsGoView
    }
    
    func timerFinish() {
        finishView = self.storyboard?.instantiateViewController(withIdentifier: "FinishView") as! FinishView
        finishView.delegate = self
        finishView.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(finishView)
        self.addSubview(subView: self.finishView!.view, toView: self.view)
        self.currentViewController = finishView
    }
    
    //MARK: - LetsGoViewDelegate
    func letsGoButtonPress() {
        self.delegate.letsGoButtonPress()
        pauseView = self.storyboard?.instantiateViewController(withIdentifier: "PauseView") as! PauseView
        pauseView.delegate = self
        pauseView.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: pauseView)
        self.currentViewController = pauseView
    }
    
    //MARK: - PauseViewDelegate
    func pauseButtonPress() {
        self.delegate.pauseButtonPress()
        finishOrContinueView = self.storyboard?.instantiateViewController(withIdentifier: "FinishOrContinueView") as! FinishOrContinueView
        finishOrContinueView.delegate = self
        finishOrContinueView.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: finishOrContinueView)
        self.currentViewController = finishOrContinueView
    }
    
    //MARK: - FinishOrContinueViewDelegate && FinishViewDelegate
    func finishButtonPress() {
        startConfiguration()
        self.delegate.finishButtonPress()
    }
    
    func continueButtonPress() {
        self.delegate.continueButtonPress()
        pauseView.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: pauseView)
        self.currentViewController = pauseView
        
    }
}
