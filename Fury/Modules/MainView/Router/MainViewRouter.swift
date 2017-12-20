//
//  MainViewMainViewRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import UIKit

class MainViewRouter: MainViewRouterInput {
    
    var view : MainViewViewController?
    
    func open() {
        let controller = GlobalAssembly.resolve(type: PreViewTimerViewInput.self) as! PreViewTimerViewController
        let navigation = CustomNavigationController(rootViewController: controller)
        navigation.isHeroEnabled = true
        view?.present(navigation, animated: true, completion: nil)
    }
}

class CustomNavigationController: UINavigationController {
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get {
            return topViewController!.supportedInterfaceOrientations
        }
    }
}
