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


class NavigationMainCoordinator: RootContainerController, TimerTypeSelectionControllerDelegate {
    
    var timerTypeSelectionController: TimerTypeSelectionController!
    var intervanNavigationController: IntervalNavigationController!
    weak var currentViewController: UIViewController?
    weak var delegate: NavigationMainControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        intervanNavigationController = self.storyboard?.instantiateViewController(withIdentifier: "IntervalNavigationController") as! IntervalNavigationController
        timerTypeSelectionController = self.storyboard?.instantiateViewController(withIdentifier: "TimerTypeSelectionController") as! TimerTypeSelectionController
        startConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startConfiguration() {
        timerTypeSelectionController.delegate = self
        timerTypeSelectionController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(timerTypeSelectionController)
        self.addSubview(subView: self.timerTypeSelectionController!.view, toView: self.view)
        self.currentViewController = timerTypeSelectionController
    }

    func changeToIntervanNavigationController() {
        intervanNavigationController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(intervanNavigationController)
        self.addSubview(subView: self.intervanNavigationController!.view, toView: self.view)
        self.currentViewController = intervanNavigationController
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

    func intervalSetting(laps: Int) {
        intervanNavigationController.titleArray = createTitleArray(laps: laps)
        changeToIntervanNavigationController()
    }
    
    private func createTitleArray(laps: Int) -> [String] {
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


