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
    
    func openSurveyView(style: TimerStyle) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let controller  = story.instantiateViewController(withIdentifier: "SurveyController") as! SurveyController
        controller.style = style
        view?.navigationController?.pushViewController(controller, animated: true)
    }
}
