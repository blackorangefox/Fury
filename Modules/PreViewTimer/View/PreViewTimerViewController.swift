//
//  PreViewTimerPreViewTimerViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class PreViewTimerViewController: UIViewController, PreViewTimerViewInput {

    var output: PreViewTimerViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PreViewTimerViewInput
    func setupInitialState() {
    }
}
