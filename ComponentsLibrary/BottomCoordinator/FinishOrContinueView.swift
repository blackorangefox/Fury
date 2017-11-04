//
//  FinishOrContinueView.swift
//  Fury
//
//  Created by Mikhail Fokin on 04/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol FinishOrContinueViewDelegate: class {
    func finishButtonPress()
    func continueButtonPress()
    func resetButtonPress()
}

class FinishOrContinueView: UIViewController {
    
    weak var delegate: FinishOrContinueViewDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finishButtonPress(_ sender: Any) {
        self.delegate.finishButtonPress()
    }
    
    @IBAction func continueButtonPress(_ sender: Any) {
        self.delegate.continueButtonPress()
    }
    
    @IBAction func resetButtonPress(_ sender: Any) {
        self.delegate.resetButtonPress()
    }
}
