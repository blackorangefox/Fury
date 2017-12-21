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

    @IBOutlet weak var sureButton: UIButton!
    @IBOutlet weak var NoButton: UIButton!
    
    var style: TimerStyle!
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return .portrait }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sureButton.setBackgroundColor(color: style.mainColor, forState: .normal)
    }
    
    @IBAction func notNowButtonPress(_ sender: Any) {
        UserDefaults.standard.set(0, forKey: "CounterStartTimer")
        self.navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func yesButtonPress(_ sender: Any) {
        if let url = URL(string: "https://dmitrykurash.typeform.com/to/lXywEJ") {
            UIApplication.shared.open(url, options: [:])
        }
        UserDefaults.standard.set(true, forKey: "user_survey")
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
}
