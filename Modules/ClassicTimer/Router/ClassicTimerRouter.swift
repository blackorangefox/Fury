//
//  ClassicTimerClassicTimerRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class ClassicTimerRouter: ClassicTimerRouterInput {

	var view : UIViewController!
    
    func openFinishView(with time: String) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "ResultController") as! ResultController
        controller.ruselt = time
        view!.present(controller, animated: true, completion: nil)
    }

}
