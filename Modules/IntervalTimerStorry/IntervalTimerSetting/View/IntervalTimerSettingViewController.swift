//
//  IntervalTimerSettingIntervalTimerSettingViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class IntervalTimerSettingViewController: UIViewController, IntervalTimerSettingViewInput {

    var output: IntervalTimerSettingViewOutput!
    @IBOutlet weak var lapsPicker: UIPickerView!
    @IBOutlet weak var minTime: UIPickerView!
    @IBOutlet weak var secondTime: UIPickerView!
    @IBOutlet weak var minRest: UIPickerView!
    @IBOutlet weak var secRest: UIPickerView!
    
    let lapsSource = IntervatSettingDDM(startFromZero: false)
    let secondsRestDS = IntervatSettingDDM(startFromZero: true)
    let minutsRestDS = IntervatSettingDDM(startFromZero: true)
    let minutsLapDS = IntervatSettingDDM(startFromZero: true)
    let secondLapDS = IntervatSettingDDM(startFromZero: true)

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
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

    @IBAction func letsGoButtonPress(_ sender: Any) {
        let laps = lapsPicker.selectedRow(inComponent: 0) + 1
        
        let secondTime = self.secondTime.selectedRow(inComponent: 0)
        let minutsTime = minTime.selectedRow(inComponent: 0)
        
        let restSecond = secRest.selectedRow(inComponent: 0)
        let restMinutus = minRest.selectedRow(inComponent: 0)
        
        //2015-04-01 12:52:00 +0000
        let roundTime = "\(String(format: "%02d", minutsTime)):\(String(format: "%02d", secondTime))"
        let restTime = "\(String(format: "%02d", restMinutus)):\(String(format: "%02d", restSecond))"
        
        output.letsGoButtonPress(laps: laps, roundTime: roundTime, restTime: restTime)
    }
    
    @IBAction func classicButtonPress(_ sender: Any) {
        output.classicButtonPress()
    }
    
    @IBAction func countdownButtonPress(_ sender: Any) {
        output.countdownButtonPress()
    }
    
    // MARK: IntervalTimerSettingViewInput
    func setupInitialState() {
    }
    
    func showAler() {
        let alert = UIAlertController(title: "Error", message: "Round time can't be 00:00", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
