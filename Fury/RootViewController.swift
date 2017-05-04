//
//  rootViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 03/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, BottomViewControllerDelegate  {

    @IBOutlet weak var navigationContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    @IBOutlet weak var mainContainer: UIView!
    var bottomViewController: BottomViewController!
    var mainViewController: MainViewController!
    
    override func viewDidLoad() {
        startConfiguration()
    }
    
    //MARK: -  BottomContainerDelegate
    
    //MARK: - Private
    func startConfiguration() {
        bottomViewController = self.storyboard?.instantiateViewController(withIdentifier: "BottomViewController") as! BottomViewController
        bottomViewController.delegate = self
        bottomViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(bottomViewController)
        self.addSubview(subView: self.bottomViewController!.view, toView: self.bottomContainer)
        
        mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
       // mainViewController.delegate = self
        mainViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(bottomViewController)
        self.addSubview(subView: self.mainViewController!.view, toView: self.mainContainer)
    }
    
    func addSubview(subView: UIView, toView parentView: UIView) {
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    
    //MARK: - BottomViewControllerDelegate
    func letsGoButtonPress() {
        mainViewController.letsGoButtonPress()
    }
    
    func pauseButtonPress() {
        mainViewController.pauseButtonPress()
    }
    
    func finishButtonPress() {
        
    }
    
    func continueButtonPress() {
        mainViewController.continueButtonPress()
    }
}
