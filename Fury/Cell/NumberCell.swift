//
//  NumberCell.swift
//  Fury
//
//  Created by Mikhail Fokin on 25/12/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

class NumberCell: UITableViewCell, NibReusable  {
    
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
