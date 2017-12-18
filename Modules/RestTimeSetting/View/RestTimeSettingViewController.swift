//
//  RestTimeSettingRestTimeSettingViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 18/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class RestTimeSettingViewController: UIViewController, RestTimeSettingViewInput {

    var output: RestTimeSettingViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: RestTimeSettingViewInput
    func setupInitialState() {
    }
}
