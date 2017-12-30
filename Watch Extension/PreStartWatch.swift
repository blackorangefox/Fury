//
//  PreStartWatch.swift
//  Watch Extension
//
//  Created by Mikhail Fokin on 30/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import WatchKit

class PreStartWatch: WKInterfaceController {
    
    @IBOutlet var picker: WKInterfacePicker!
    
    var itemList: [String] = ["10",
                              "9",
                              "8",
                              "7",
                              "6",
                              "5",
                              "4",
                              "3",
                              "2",
                              "1",
                              "GO"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let pickerItems: [WKPickerItem] = itemList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        picker.setItems(pickerItems)
    }
}

