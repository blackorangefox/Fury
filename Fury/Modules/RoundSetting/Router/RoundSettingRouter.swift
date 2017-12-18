//
//  RoundSettingRoundSettingRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class RoundSettingRouter: RoundSettingRouterInput {
	
	var view : RoundSettingViewController?
	
    func openSetWorkTime() {
        let controller = GlobalAssembly.resolve(type: TimeSettingViewInput.self) as! UIViewController
        view?.navigationController?.pushViewController(controller, animated: true)
    }
}
