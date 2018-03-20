//
//  ResultScreenResultScreenRouter.swift
//  fury
//
//  Created by Mikhail Fokin on 13/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import UIKit

class ResultScreenRouter: ResultScreenRouterInput {
	
	var view : ResultScreenViewController?
    
    func openMainView() {
        view?.navigationController?.dismiss(animated: true, completion: nil)
    }
}
