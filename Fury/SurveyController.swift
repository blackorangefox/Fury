//
//  SurveyController.swift
//  Fury
//
//  Created by Mikhail Fokin on 26/07/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import Foundation

class SurveyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notNowButtonPress(_ sender: Any) {
        UserDefaults.standard.set(Date(), forKey: "TimeForSurvey")
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func yesButtonPress(_ sender: Any) {
        if let url = URL(string: "https://dmitrykurash.typeform.com/to/lXywEJ") {
            UIApplication.shared.open(url, options: [:])
        }
        UserDefaults.standard.set(true, forKey: "AlwaysShowSurvey")
        self.dismiss(animated: false, completion: nil)
    }
}
