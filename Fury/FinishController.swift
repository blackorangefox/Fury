//
//  FinishController.swift
//  Fury
//
//  Created by Mikhail Fokin on 23/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

class FinishController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPress(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }



}
