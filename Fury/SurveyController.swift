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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func notNowButtonPress(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func yesButtonPress(_ sender: Any) {
        if let url = URL(string: "https://dmitrykurash.typeform.com/to/lXywEJ") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
