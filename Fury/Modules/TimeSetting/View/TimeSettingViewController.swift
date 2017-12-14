//
//  TimeSettingTimeSettingViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class TimeSettingViewController: UIViewController, TimeSettingViewInput {

    var output: TimeSettingViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: TimeSettingViewInput
    func setupInitialState() {
    }
}
