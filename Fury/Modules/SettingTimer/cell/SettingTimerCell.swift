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

protocol SettingTimerCellModel {
    var label: String { get set }
    var textField: String { get set }
    var type: TypePicker { get set }
}

final class SettingTimerCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private var type: TypePicker = .sec
    private var pickerOption = Array(1...100)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        var pickerView = UIPickerView()
        pickerView.delegate = self
        selectionStyle = .none
    }
    
    func configure(model: SettingTimerCellModel) {
        self.label.text = model.label
        self.textField.text = model.label
        self.type = model.type
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
        return pickerOption.count
    }
    
}

extension SettingTimerCell: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch type {
        case .hourseMinSec:
            return "\(pickerOption[Int])hrs"
        case .sec, .round:
            return 1
        case .round:
            
        }
    }
}
