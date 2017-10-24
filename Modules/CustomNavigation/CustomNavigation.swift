//
//  CustomNavigation.swift
//  Fury
//
//  Created by Mikhail Fokin on 30/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigation: UIViewController, CustomNavigationProtocol, RootContainerControllerProtocol {
 
    @IBOutlet weak var classicTimerButton: UIButton!
    @IBOutlet weak var intervalTimerButton: UIButton!
    @IBOutlet weak var countdownTimerButton: UIButton!
    @IBOutlet weak var mainContainer: UIView!
    var classicTimerController: UINavigationController!
    var intervalTimerController: UINavigationController!
    var countdownTimerController: UINavigationController!
    weak var currentViewController: UINavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classicTimerController = initClassicTimerController()
        intervalTimerController = initIntervalTimerController()
        countdownTimerController = initCountdownTimerControlle()
        
        self.addSubview(classicTimerController, container: mainContainer)
        currentViewController = classicTimerController
        
        classicTimerButton.setTitleColor(.white, for: .normal)
        classicTimerButton.setTitleColor(.furyYellowGreen, for: .disabled)
        
        intervalTimerButton.setTitleColor(.white, for: .normal)
        intervalTimerButton.setTitleColor(.furyYellowGreen, for: .disabled)
        
        countdownTimerButton.setTitleColor(.white, for: .normal)
        countdownTimerButton.setTitleColor(.furyYellowGreen, for: .disabled)
        
        classicTimerButton.isEnabled = false
    }
    
    func initClassicTimerController() -> UINavigationController {
        let controller = GlobalAssembly.resolve(type: ClassicTimerViewInput.self) as! UIViewController
        return createNavigation(vc: controller)
    }
    
    func initIntervalTimerController() -> UINavigationController {
        let controller = GlobalAssembly.resolve(type: IntervalTimerSettingViewInput.self) as! UIViewController
        return createNavigation(vc: controller)
    }
    
    func initCountdownTimerControlle() -> UINavigationController {
        let controller = GlobalAssembly.resolve(type: CoutdownTimerViewInput.self) as! UIViewController
        return createNavigation(vc: controller)
    }
    
    func createNavigation(vc: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.isNavigationBarHidden = true
        navigationController.isHeroEnabled = true
        return navigationController
    }
    
    @IBAction func classicTimerButtonPress(_ sender: Any) {
        classicTimerButton.isEnabled = false
        intervalTimerButton.isEnabled = true
        countdownTimerButton.isEnabled = true
        changeControllerTo(vc: classicTimerController)
    }
    
    @IBAction func intervalTimerButtonPress(_ sender: Any) {
        classicTimerButton.isEnabled = true
        intervalTimerButton.isEnabled = false
        countdownTimerButton.isEnabled = true
        changeControllerTo(vc: intervalTimerController)
    }
    
    @IBAction func countdownTimerButtonPress(_ sender: Any) {
        classicTimerButton.isEnabled = true
        intervalTimerButton.isEnabled = true
        countdownTimerButton.isEnabled = false
        changeControllerTo(vc: countdownTimerController)
    }
    
    func changeControllerTo(vc: UINavigationController) {
        embeddedTransition(oldViewController: currentViewController, toViewController: vc, container: mainContainer)
        self.currentViewController = vc
    }
    
}
