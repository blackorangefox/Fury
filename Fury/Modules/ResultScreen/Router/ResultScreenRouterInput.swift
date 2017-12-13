//
//  ResultScreenResultScreenRouterInput.swift
//  fury
//
//  Created by Mikhail Fokin on 13/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import Foundation

protocol ResultScreenRouterInput {

	weak var view: ResultScreenViewController? { get set }
    func openMainView()
}
