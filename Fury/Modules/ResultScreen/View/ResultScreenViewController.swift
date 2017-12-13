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
    var type: timerType = .countdown
    var result: String = ""
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        resultLabel.text = result
        style()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func style() {
        let gradientLayer = CAGradientLayer()
        switch type {
        case .classic:
            gradientLayer.colors = [UIColor.furyClassicGradientBot.cgColor, UIColor.furyClassicGradientTop.cgColor]
            logoImage.image = UIImage(named: "classicSmall")
            okButton.setBackgroundColor(color: UIColor.furyPinkRed, forState: .normal)
            shareButton.setBackgroundColor(color: UIColor.furyPinkRed, forState: .normal)
            subTitleLabel.text = "MY RESULT"
        case .interval:
            gradientLayer.colors = [UIColor.furyIntervalGradientTop.cgColor, UIColor.furyIntervalGradientBot.cgColor]
            logoImage.image = UIImage(named: "intervalSmall")
            okButton.setBackgroundColor(color: UIColor.furyGoldenYellow, forState: .normal)
            shareButton.setBackgroundColor(color: UIColor.furyGoldenYellow, forState: .normal)
            subTitleLabel.text = "MY RESULT"
        case .countdown:
            gradientLayer.colors = [UIColor.furyCountdownGradientBot.cgColor, UIColor.furyCountdownGradientTop.cgColor]
            logoImage.image = UIImage(named: "countdownSmall")
            okButton.setBackgroundColor(color: UIColor.furyBrightLavender, forState: .normal)
            shareButton.setBackgroundColor(color: UIColor.furyBrightLavender, forState: .normal)
            subTitleLabel.text = "COMPLETED"
        }
        let screenRect = UIScreen.main.bounds
        gradientLayer.frame = CGRect(x: 0, y: 0, width: screenRect.width-48, height: screenRect.width-48)
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }

    @IBAction func okButtonPress(_ sender: Any) {
    }
    
    @IBOutlet weak var shareButtonPress: UIButton!
    // MARK: ResultScreenViewInput
    func setupInitialState() {
    }
}
