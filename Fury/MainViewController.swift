//
//  MainViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 04/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol MainViewInput: class {
    func letsGoButtonPress()
    func pauseButtonPress()
    func continueButtonPress()
}

class MainViewController: RootContainerController {

    var timerViewController: TimerViewController!
    weak var currentViewController: MainViewInput!
    
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
        timerViewController = self.storyboard?.instantiateViewController(withIdentifier: "TimerViewController") as! TimerViewController
        //timerViewController.delegate = self
        timerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(timerViewController)
        self.addSubview(subView: self.timerViewController!.view, toView: self.view)
        self.currentViewController = timerViewController
    }
    
    func letsGoButtonPress() {
        self.currentViewController.letsGoButtonPress()
    }
    
    func pauseButtonPress() {
        self.currentViewController.pauseButtonPress()
    }
    
    func continueButtonPress() {
        self.currentViewController.continueButtonPress()
    }
    
}
