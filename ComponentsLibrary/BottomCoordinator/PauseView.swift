//
//  PauseView.swift
//  Fury
//
//  Created by Mikhail Fokin on 03/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol PauseViewDelegate: class {
    func pauseButtonPress()
}

class PauseView: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    weak var delegate: PauseViewDelegate!
    
    var type: TimerType = .classic
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func PauseButtonPress(_ sender: Any) {
        delegate.pauseButtonPress()
    }


}
