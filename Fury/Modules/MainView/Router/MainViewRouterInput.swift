//
//  MainViewMainViewRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

protocol MainViewRouterInput {

	weak var view: MainViewViewController? { get set }
    func open()
}
