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
	
    func open(type: timerType) {
        let controller = GlobalAssembly.resolve(type: PreViewTimerViewInput.self) as! PreViewTimerViewController
        controller.type = type
        let navigation = UINavigationController(rootViewController: controller)
        navigation.isHeroEnabled = true
        view?.present(navigation, animated: true, completion: nil)
    }
}
