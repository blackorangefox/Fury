//
//  ClassicTimerClassicTimerRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class ClassicTimerRouter: ClassicTimerRouterInput {
	
	var view : UIViewController?
	
    // контрллеры постоянно плодяться - раходуется память
    func openIntervalTimer() {
        let newView = GlobalAssembly.resolve(type: IntervalTimerSettingViewInput.self) as! UIViewController
        view.di
        view?.present(newView, animated: true, completion: nil)
    }
}
