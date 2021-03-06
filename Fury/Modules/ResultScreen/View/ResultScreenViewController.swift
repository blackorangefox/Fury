//
//  ResultScreenResultScreenViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 13/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class ResultScreenViewController: UIViewController, ResultScreenViewInput {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var output: ResultScreenViewOutput!
    var result: String = ""
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return .portrait }
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get { return .portrait }
    }
    
    override var shouldAutorotate: Bool {
        get {return false}
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        resultLabel.text = result
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        self.view.backgroundColor = UIColor.furyBackgroundColor
    }
    
    func setHero(type: TimerType) {
        switch type {
        case .classic:
            gradientView.heroID = "classicView"
            logoImage.heroID = "classicLogo"
        case .interval:
            gradientView.heroID = "intervalView"
            logoImage.heroID = "intervalLogo"
        case .countdown:
            gradientView.heroID = "countdownView"
            logoImage.heroID = "countdownLogo"
        }
    }
    
    func styleze(by style: TimerStyle) {
        let screenRect = UIScreen.main.bounds
        let size = CGSize(width: screenRect.width-48, height: screenRect.width-48)
        gradientView.setGradienBackgroundBy(colors: style.gradientColor, size: size)
        logoImage.image = style.bigLogo
        okButton.setBackgroundColor(color: style.mainColor, forState: .normal)
        okButton.setTitleColor(UIColor.furyBackgroundColor, for: .normal)
        shareButton.setBackgroundColor(color: style.mainColor, forState: .normal)
        shareButton.setTitleColor(UIColor.furyBackgroundColor, for: .normal)
        subTitleLabel.text = style.subTitle
    }
    
    @IBAction func okButtonPress(_ sender: Any) {
        output.okButtonPress()
    }
    
    @IBAction func sharedButtonPress(_ sender: Any) {
        UIGraphicsBeginImageContextWithOptions(gradientView.frame.size, true, 0.0)
        gradientView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        var objectsToShare = [AnyObject]()
        
        objectsToShare.append("My result" as AnyObject)
        
        if let shareImageObj = image{
            objectsToShare.append(shareImageObj)
        }
        
        
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: ResultScreenViewInput
    func setupInitialState() {
    }
}
