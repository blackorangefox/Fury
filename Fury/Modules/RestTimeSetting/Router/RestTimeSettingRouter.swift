//
//  RestTimeSettingRestTimeSettingRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 18/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import UIKit

class RestTimeSettingRouter: RestTimeSettingRouterInput {
	
	var view : TimeSettingViewController?
    
    func openPrestert() {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let preScreen  = story.instantiateViewController(withIdentifier: "PreStartController") as! PreStartController
        view?.navigationController?.pushViewController(preScreen, animated: true)
    }
}
