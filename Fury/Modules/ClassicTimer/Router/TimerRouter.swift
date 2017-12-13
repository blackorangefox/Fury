//
//  ClassicTimerClassicTimerRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class TimerRouter: TimerRouterInput {

	var view : UIViewController!
    
    func openFinishView(with time: String, type: timerType) {
        let controller = GlobalAssembly.resolve(type: ResultScreenViewInput.self) as! ResultScreenViewController
        controller.type = type
        controller.result = time
        view.navigationController?.pushViewController(controller)
    }

}
