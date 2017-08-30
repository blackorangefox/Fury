//
//  rootViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 03/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

enum TimerType {
    case classic
    case interval
    case countdown
}

class RootViewController: RootContainerController, BottomViewControllerDelegate, NavigationMainControllerDelegate, MainViewCoordinatorDelegate  {

    @IBOutlet weak var navigationContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var mainContainer: UIView!
    var bottomViewController: BottomCoordinator!
    var mainViewController: MainViewCoordinator!
    var navigationMainController: NavigationMainCoordinator!
    var timerType: TimerType!
    
    override func viewDidLoad() {
        startConfiguration()
    }
    
    //MARK: -  BottomContainerDelegate
    
    //MARK: - Private
    func startConfiguration() {
        bottomViewController = self.storyboard?.instantiateViewController(withIdentifier: "BottomViewController") as! BottomCoordinator
        bottomViewController.delegate = self
        bottomViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(bottomViewController)
        self.addSubview(subView: self.bottomViewController!.view, toView: self.bottomContainer)
        
        mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewCoordinator
        mainViewController.delegate = self
        mainViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(mainViewController)
        self.addSubview(subView: self.mainViewController!.view, toView: self.mainContainer)
        mainViewController.openTimeByType(timerType: .classic)
        
        navigationMainController = self.storyboard?.instantiateViewController(withIdentifier: "NavigationMainController") as! NavigationMainCoordinator
        navigationMainController.delegate = self
        navigationMainController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(navigationMainController)
        self.addSubview(subView: self.navigationMainController!.view, toView: self.navigationContainer)
    }
    
    
    //MARK: - BottomViewControllerDelegate
    func letsGoButtonPress() {
        mainViewController.letsGoButtonPress()
    }
    
    func pauseButtonPress() {
        mainViewController.pauseButtonPress()
    }
    
    func finishButtonPress() {
        mainViewController.finishButtonPress()
        navigationMainController.finishButtonPress()
    }
    
    func continueButtonPress() {
        mainViewController.continueButtonPress()
    }
    
    //MARK: - NavigationMainControllerDelegate
    func classicButtonPress() {
        timerType = .classic
        mainViewController.openTimeByType(timerType: timerType)
       // bottomViewController.startConfiguration()
    }
    
    func intervalButtonPress() {
        timerType = .interval
        mainViewController.openTimeByType(timerType: timerType)
       // bottomViewController.startConfiguration()
    }
    
    func countdownButtonPress() {
        timerType = .countdown
        mainViewController.openTimeByType(timerType: timerType)
       // bottomViewController.startConfiguration()
    }

    //MARK: -  MainViewCoordinatorDelegate
    func timerFinish() {
        //bottomViewController.timerFinish()
    }

    func openIntervatController() {
        self.navigationMainController.changeToIntervanNavigationController()
    }

    func nextSegment() {
        self.navigationMainController.nextSegment()
    }

    func intervalSetting(laps: Int, isRest: Bool) {
        self.navigationMainController.intervalSetting(laps: laps, isRest: isRest)
    }
}
