//
//  IntervalMainViewController.swift
//  Fury
//
//  Created by Mikhail Fokin on 05/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol  SettingIntervalMainViewControllerDelegate: class {
    func setting(laps: Int, lapTime: Date, restTime: Date)
}

class SettingIntervalMainViewController: UIViewController, MainViewInputProtocol {
    
    @IBOutlet weak var secRest: UIPickerView!
    @IBOutlet weak var lapsPicker: UIPickerView!
    @IBOutlet weak var minTime: UIPickerView!
    @IBOutlet weak var secondTime: UIPickerView!
    @IBOutlet weak var minRest: UIPickerView!
    let lapsSource = LapsPickerDataSource()
    let secRestSoyrce = LapsPickerDataSource()
    let minRestSource = LapsPickerDataSource()
    let minTimeSource = LapsPickerDataSource()
    let secTimeSource = LapsPickerDataSource()

    weak var delegate: SettingIntervalMainViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lapsPicker.dataSource = lapsSource
        lapsPicker.delegate = lapsSource
        
        secRest.delegate = secRestSoyrce
        secRest.dataSource = secRestSoyrce
        
        minRest.delegate = minRestSource
        minRest.dataSource = minRestSource
        
        secondTime.delegate = secTimeSource
        secondTime.dataSource = secTimeSource
        
        minTime.delegate = minTimeSource
        minTime.dataSource = minTimeSource
        
        //lapsPicker.reloadAllComponents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func letsGoButtonPress() {
        let format = DateFormatter()
        format.dateFormat = "mm:ss"
        let laps = lapsPicker.selectedRow(inComponent: 0)

        let secondTime = self.secondTime.selectedRow(inComponent: 0)
        let minutsTime = minTime.selectedRow(inComponent: 0)
        let timeDate = format.date(from: "\(minutsTime):\(secondTime)")

        let restSecond = secRest.selectedRow(inComponent: 0)
        let restMinutus = minRest.selectedRow(inComponent: 0)
        let restDate = format.date(from: "\(restMinutus):\(restSecond)")
        delegate.setting(laps: laps, lapTime: timeDate!, restTime: restDate!)
    }
}

class LapsPickerDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let color = (row == pickerView.selectedRow(inComponent: component)) ? UIColor.furyYellowGreen : UIColor.white.withAlphaComponent(0.3)
        return NSAttributedString(string: "\(row)", attributes: [NSForegroundColorAttributeName: color])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 65
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label = view as! UILabel!
        if label == nil {
            label = UILabel()
        }
        
        let font = (row == pickerView.selectedRow(inComponent: component)) ? UIFont(name: "Roboto-Bold", size: 48.0)! : UIFont(name: "Roboto-Bold", size: 36.0)!
        let color = (row == pickerView.selectedRow(inComponent: component)) ? UIColor.furyYellowGreen : UIColor.white.withAlphaComponent(0.3)
        let title = NSAttributedString(string: "\(row)", attributes: [NSFontAttributeName: font])
        label?.attributedText = title
        label?.textColor = color
        label?.textAlignment = .center
        return label!
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }
    
}
