//
//  PreViewTimerPreViewTimerRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class PreViewTimerRouter: PreViewTimerRouterInput {
	
	var view : PreViewTimerViewController?
	
    func openPrestert(style: TimerStyle) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let preScreen  = story.instantiateViewController(withIdentifier: "PreStartController") as! PreStartController
        preScreen.style = style
        view?.navigationController?.pushViewController(preScreen, animated: true)
    }
    
    func openRoundSetting() {
        let controller = GlobalAssembly.resolve(type: RoundSettingViewInput.self) as! UIViewController
        view?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func openSetTime() {
        let controller = GlobalAssembly.resolve(type: TimeSettingViewInput.self) as! UIViewController
        view?.navigationController?.pushViewController(controller, animated: true)
    }
}
