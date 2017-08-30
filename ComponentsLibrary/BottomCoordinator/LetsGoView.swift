//
//  LetsGoView.swift
//  Fury
//
//  Created by Mikhail Fokin on 03/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol LetsGoViewDelegate: class {
    func letsGoButtonPress()
}

class LetsGoView: UIViewController {

    weak var delegate: LetsGoViewDelegate!
    
    @IBAction func LetsGoButtonPress(_ sender: Any) {
        self.delegate.letsGoButtonPress()
    }
    

}
