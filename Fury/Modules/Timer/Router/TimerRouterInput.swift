//
//  ClassicTimerClassicTimerRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation
import UIKit

protocol TimerRouterInput {

	weak var view: UIViewController! { get set }
    func openFinishView(with time: String, type: timerType)
}
