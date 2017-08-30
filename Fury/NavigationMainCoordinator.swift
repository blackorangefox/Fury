//
//  NavigationMainCoordinator.swift
//  Fury
//
//  Created by Mikhail Fokin on 05/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol NavigationMainControllerDelegate: class {
    func classicButtonPress()
    func intervalButtonPress()
    func countdownButtonPress()
}


class NavigationMainCoordinator: UIViewController, RootContainerControllerProtocol, TimerTypeSelectionControllerDelegate {
    
    var timerTypeSelectionController: TimerTypeSelectionController!
    var intervanNavigationController: IntervalNavigationController!
    weak var delegate: NavigationMainControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startConfiguration()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startConfiguration() {
        timerTypeSelectionController = createTimerTypeSelectionController()
        //self.showViewController(controller: timerTypeSelectionController)
        timerTypeSelectionController.startConfiguration()
    }
    
    func changeToIntervanNavigationController() {
        intervanNavigationController = createIntervalNavigationController()
        //self.showViewController(controller: intervanNavigationController)
    }
    
    func createIntervalNavigationController() -> IntervalNavigationController {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "IntervalNavigationController") as! IntervalNavigationController
        return controller
    }
    
    func createTimerTypeSelectionController() -> TimerTypeSelectionController {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "TimerTypeSelectionController") as! TimerTypeSelectionController
        controller.delegate = self
        return controller
    }
    
    //MARK: Bottom event
    func finishButtonPress() {
        startConfiguration()
    }
    
    //MARK: - TimerTypeSelectionControllerDelegate
    func classicButtonPress() {
        self.delegate.classicButtonPress()
    }
    
    func intervalButtonPress() {
        self.delegate.intervalButtonPress()
    }
    
    func countdownButtonPress() {
        self.delegate.countdownButtonPress()
    }
    
    public func nextSegment() {
        intervanNavigationController.nextSegment()
    }
    
    func intervalSetting(laps: Int, isRest: Bool) {
        intervanNavigationController = createIntervalNavigationController()
        if isRest {
            intervanNavigationController.titleArray = createTitleWithRest(laps: laps)
        }else {
            intervanNavigationController.titleArray = createTitleWithoutRest(laps: laps)
        }
       // showViewController(controller: intervanNavigationController)
    }
    
    private func createTitleWithoutRest(laps: Int) -> [String] {
        var titleArray: [String] = []
        for index in 1...laps {
            let lapsTitle = "LAP" + " \(index)"
            titleArray.append(lapsTitle)
        }
        var lastLapTitle = titleArray.last
        lastLapTitle = "FINISH"
        titleArray[titleArray.count-1] = lastLapTitle!
        return titleArray
    }
    
    private func createTitleWithRest(laps: Int) -> [String] {
        var titleArray: [String] = []
        for index in 1...laps {
            let lapsTitle = "LAP" + " \(index)"
            let rest = "REST"
            titleArray.append(lapsTitle)
            titleArray.append(rest)
        }
        titleArray.removeLast()
        var lastLapTitle = titleArray.last
        lastLapTitle = "FINISH"
        titleArray[titleArray.count-1] = lastLapTitle!
        return titleArray
    }
}


