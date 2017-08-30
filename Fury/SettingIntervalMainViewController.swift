//
//  IntervalMainViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 05/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol  SettingIntervalMainViewControllerDelegate: class {
    func createTimerWithParams(laps: Int, lapTime: Date, restTime: Date)
}

class SettingIntervalMainViewController: UIViewController, MainViewInputProtocol {
    
    @IBOutlet weak var secRest: UIPickerView!
    @IBOutlet weak var lapsPicker: UIPickerView!
    @IBOutlet weak var minTime: UIPickerView!
    @IBOutlet weak var secondTime: UIPickerView!
    @IBOutlet weak var minRest: UIPickerView!
    let lapsSource = IntervatSettingDDM(startFromZero: false)
    let secondsRestDS = IntervatSettingDDM(startFromZero: true)
    let minutsRestDS = IntervatSettingDDM(startFromZero: true)
    let minutsLapDS = IntervatSettingDDM(startFromZero: true)
    let secondLapDS = IntervatSettingDDM(startFromZero: true)

    weak var delegate: SettingIntervalMainViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lapsPicker.dataSource = lapsSource
        lapsPicker.delegate = lapsSource
        
        secRest.delegate = secondsRestDS
        secRest.dataSource = secondsRestDS
        
        minRest.delegate = minutsRestDS
        minRest.dataSource = minutsRestDS
        
        secondTime.delegate = secondLapDS
        secondTime.dataSource = secondLapDS
        
        minTime.delegate = minutsLapDS
        minTime.dataSource = minutsLapDS
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func letsGoButtonPress() {
        let format = DateFormatter()
        format.dateFormat = "mm:ss"
        let laps = lapsPicker.selectedRow(inComponent: 0) + 1

        let secondTime = self.secondTime.selectedRow(inComponent: 0) + 1
        let minutsTime = minTime.selectedRow(inComponent: 0)
        let timeDate = format.date(from: "\(minutsTime):\(secondTime)")

        let restSecond = secRest.selectedRow(inComponent: 0)
        let restMinutus = minRest.selectedRow(inComponent: 0)
        let restDate = format.date(from: "\(restMinutus):\(restSecond)")
        delegate.createTimerWithParams(laps: laps, lapTime: timeDate!, restTime: restDate!)
    }
}
