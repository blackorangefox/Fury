//
//  ResultController.swift
//  Fury
//
//  Created by Mikhail Fokin on 23/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var ruseltTitle: UILabel!
    var ruselt: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ruseltTitle.text = ruselt
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonPress(_ sender: Any) {
       self.dismiss(animated: false, completion: nil)
    }

    @IBAction func sharedButtonPress(_ sender: Any) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let textToShare = "FURY timer"
        
        if let myWebsite = URL(string: "https://itunes.apple.com/us/app/fury-timer/id1239557004?ls=1&mt=8") {
            let objectsToShare = [textToShare, myWebsite, image ?? #imageLiteral(resourceName: "app-logo")] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //Excluded Activities
            activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            //
            
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        }
    }

}
