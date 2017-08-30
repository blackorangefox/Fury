//
//  ClassicTimerClassicTimerRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation
import UIKit

protocol ClassicTimerRouterInput {

	weak var view: UIViewController? { get set }
    
    func openIntervalTimer()
}
