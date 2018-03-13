//
//  TimeSettingTimeSettingRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import UIKit

class TimeSettingRouter: TimeSettingRouterInput {

	var view : TimeSettingViewController?
    
    func openPrestart(style: TimerStyle) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let preScreen  = story.instantiateViewController(withIdentifier: "PreStartController") as! PreStartController
        preScreen.style = style
        view?.navigationController?.pushViewController(preScreen, animated: true)
    }
    
    func openSetRestTime() {
        let controller = GlobalAssembly.resolve(type: TimeSettingViewInput.self, name: "RestTime") as! UIViewController
        view?.navigationController?.pushViewController(controller, animated: true)
    }
	
}
