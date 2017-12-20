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
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        resultLabel.text = result
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        logoImage.image = style.smallLogo
        okButton.setBackgroundColor(color: style.mainColor, forState: .normal)
        shareButton.setBackgroundColor(color: style.mainColor, forState: .normal)
        subTitleLabel.text = style.subTitle
    }
    
    @IBAction func okButtonPress(_ sender: Any) {
        output.okButtonPress()
    }
    
    @IBOutlet weak var shareButtonPress: UIButton!
    // MARK: ResultScreenViewInput
    func setupInitialState() {
    }
}
