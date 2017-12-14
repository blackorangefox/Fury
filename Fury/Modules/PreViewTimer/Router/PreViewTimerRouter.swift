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
	
    func openPreStartController() {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let preScreen  = story.instantiateViewController(withIdentifier: "PreStartController") as! PreStartController
        view?.navigationController?.pushViewController(preScreen, animated: true)
    }
}
