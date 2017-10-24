//
//  IntervalTimerIntervalTimerRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 18/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

protocol IntervalTimerRouterInput {

	weak var viewController: UIViewController? { get set }

    func closeView()
}
