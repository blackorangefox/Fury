//
//  IntervatSettingDDM.swift
//  Fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import UIKit

class IntervatSettingDDM: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var startFromZero: Bool
    
    init(startFromZero: Bool) {
        self.startFromZero = startFromZero
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 59
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return startFromZero ? "\(row)" : "\(row+1)"
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
        let titleString = startFromZero ? "\(row)" : "\(row+1)"
        let title = NSAttributedString(string: titleString, attributes: [NSFontAttributeName: font])
        label?.attributedText = title
        label?.textColor = color
        label?.textAlignment = .center
        label?.adjustsFontSizeToFitWidth = true
        label?.minimumScaleFactor = 0.5
        return label!
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }
}
