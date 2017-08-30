//
//  FinishView.swift
//  Fury
//
//  Created by Mikhail Fokin on 25/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol FinishViewDelegate: class {
    func finishButtonPress()
}

class FinishView: UIViewController {
    
    weak var delegate: FinishViewDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func finishButtonPress(_ sender: Any) {
        delegate.finishButtonPress()
    }

}
