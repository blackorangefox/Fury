//
//  CountdowController.swift
//  Fury
//
//  Created by Mikhail Fokin on 13/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol CountdowControllerDelegate: class {
    func setting(time: Date)
}

class CountdowController: UIViewController, MainViewInputProtocol {

    @IBOutlet weak var minTime: UIPickerView!
    @IBOutlet weak var secondTime: UIPickerView!
    let secTimeSource = IntervatSettingDDM(startFromZero: true)
    let minTimeSource = IntervatSettingDDM(startFromZero: true)
    weak var delegate: CountdowControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondTime.delegate = secTimeSource
        secondTime.dataSource = secTimeSource
        
        minTime.delegate = minTimeSource
        minTime.dataSource = minTimeSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func letsGoButtonPress() {
        let format = DateFormatter()
        format.dateFormat = "mm:ss"
        
        let secondTime = self.secondTime.selectedRow(inComponent: 0)+1
        let minutsTime = minTime.selectedRow(inComponent: 0)
        let timeDate = format.date(from: "\(minutsTime):\(secondTime)")
        
        delegate.setting(time: timeDate!)
    }
}
