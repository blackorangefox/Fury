//
//  PreStartController.swift
//  Fury
//
//  Created by Mikhail Fokin on 16/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
protocol PreStartControllerDelegate: class {
    func goShow()
}

class PreStartController: UIViewController {
    
    weak var delegate: PreStartControllerDelegate!
    
    @IBOutlet weak var numberLabel: UILabel!
    var completionBlock : (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func animateWithString(_ count: Int) {
        numberLabel.font = UIFont(name: "Oswald-Bold", size: 154) // set font siz
        if count == 0 {
            numberLabel.text = "GO"
            delegate.goShow()
        }else {
            numberLabel.text = "\(count)"
        }
        numberLabel.transform = numberLabel.transform.scaledBy(x: 0.5, y: 0.5);
        numberLabel.contentScaleFactor = 1
        UIView.animate(withDuration: 1.0, animations: {
            self.numberLabel.transform = self.numberLabel.transform.scaledBy(x: 3, y: 3);
        }) { (complition) in
            if complition {
                if self.numberLabel.text == "GO" {
                    self.removeFromSuperview()
                    return
                }
                self.numberLabel.transform = CGAffineTransform.identity
                self.animateWithString(count - 1)
            }
        }
    }

    func removeFromSuperview() {
        self.dismiss(animated: false, completion: {
            self.completionBlock!()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
