//
//  CoutdownTimerCoutdownTimerViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 31/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class CoutdownTimerViewController: UIViewController, CoutdownTimerViewInput {

    var output: CoutdownTimerViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: CoutdownTimerViewInput
    func setupInitialState() {
    }
}
