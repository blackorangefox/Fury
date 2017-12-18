//
//  TimeSettingTimeSettingRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

protocol TimeSettingRouterInput {

	weak var view: TimeSettingViewController? { get set }
    func openPrestert()
    func openSetRestTime()
}

