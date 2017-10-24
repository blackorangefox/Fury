//
//  IntervalTimerIntervalTimerRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 18/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import UIKit

class IntervalTimerRouter: IntervalTimerRouterInput {
	
	var viewController : UIViewController?
    
    func closeView() {
        viewController?.dismiss(animated: true, completion: nil)
    }
	
}

