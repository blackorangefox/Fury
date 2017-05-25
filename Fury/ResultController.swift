//
//  ResultController.swift
//  Fury
//
//  Created by Mikhail Fokin on 23/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var ruseltTitle: UILabel!
    var ruselt: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ruseltTitle.text = ruselt
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPress(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }

    @IBAction func sharedButtonPress(_ sender: Any) {
    }

}
