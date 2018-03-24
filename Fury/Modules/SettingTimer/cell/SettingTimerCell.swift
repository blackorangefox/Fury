//
//  SettingTimerCell.swift
//  Fury
//
//  Created by Mikhail Fokin on 23/03/2018.
//  Copyright © 2018 Mikhail Fokin. All rights reserved.
//

import UIKit

enum TypePicker {
    case hourseMinSec
    case sec
    case round
}

struct  SettingTimerCellModel {
    var label: String
    var textField: String
    var type: TypePicker
    
    init(label: String,
         textField: String,
         type: TypePicker) {
        self.label = label
        self.textField = textField
        self.type = type
    }
    
}

final class SettingTimerCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private var type: TypePicker = .sec
    
    var hour = 0
    var minutes = 0
    var seconds = 0
    var round = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        

        textField.inputView = pickerView
        selectionStyle = .none
    }
    
    func configure(model: SettingTimerCellModel) {
        self.label.text = model.label
        self.textField.text = model.textField
        self.type = model.type
    }
    
    private func updateLabel() {
        switch type {
        case .hourseMinSec:
            textField.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
        case .sec:
            textField.text = "\(seconds) seconds"
        case .round:
            return textField.text = "\(round) rounds"
        }
    }
}

extension SettingTimerCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch type {
        case .hourseMinSec:
            return 3
        case .sec, .round:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch type {
        case .hourseMinSec:
            switch component {
            case 0:
                return 23
            case 1,2:
                return 60
            default:
                return 0
            }
        case .sec:
            return 59
        case .round:
            return 99
        }
    }
}

extension SettingTimerCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch type {
        case .hourseMinSec:
            switch component {
            case 0:
                return "\(row) hrs"
            case 1:
                return "\(row) min"
            case 2:
                return "\(row) sec"
            default:
                return ""
            }
        case .sec:
            return "\(row+1) sec"
        case .round:
            return "\(row+1) rounds"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch type {
        case .hourseMinSec:
            switch component {
            case 0:
                hour = row
            case 1:
                minutes = row
            case 2:
                seconds = row
            default:
                break
            }
        case .sec:
            seconds = row + 1
        case .round:
            round = row + 1
        }
        updateLabel()
    }
        
}
