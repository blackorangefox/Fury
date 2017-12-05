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
        return startFromZero ? 60 : 59
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return startFromZero ? "\(row)" : "\(row+1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let flag = isRowSelect(pickerView, viewForRow: row, forComponent: component)
        let color = flag ? UIColor.furyYellowGreen : UIColor.white.withAlphaComponent(0.4)
        return NSAttributedString(string: "\(row)", attributes: [NSAttributedStringKey.foregroundColor: color])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let flag = isRowSelect(pickerView, viewForRow: row, forComponent: component)
        guard let label = view as? UILabel else {
            let label = UILabel(frame: pickerView.frame)
            return configure(label: label, isRowSelect: flag, viewForRow: row)
        }
        return configure(label: label, isRowSelect: flag, viewForRow: row)
    }
    
    func isRowSelect(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int) -> Bool {
        return row == pickerView.selectedRow(inComponent: component)
    }
    
    func configure(label: UILabel, isRowSelect flag: Bool, viewForRow row: Int) -> UILabel {
        let font = flag ? UIFont.furyTextStyle6 : UIFont.furyTextStyle7
        let color = flag ? UIColor.furyYellowGreen : UIColor.white.withAlphaComponent(0.4)
        let titleString = startFromZero ?  String(format: "%02d", row) : String(format: "%02d", row+1)
        let title = NSAttributedString(string: titleString, attributes: [NSAttributedStringKey.font: font])
        label.attributedText = title
        label.textColor = color
        label.textAlignment = .center
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadAllComponents()
    }
}
