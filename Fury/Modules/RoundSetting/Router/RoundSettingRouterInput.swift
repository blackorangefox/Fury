//
//  RoundSettingRoundSettingRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

protocol RoundSettingRouterInput {

	weak var view: RoundSettingViewController? { get set }
    func openSetWorkTime()
}
