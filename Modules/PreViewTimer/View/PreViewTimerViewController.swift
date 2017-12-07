//
//  PreViewTimerPreViewTimerViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }}

class PreViewTimerViewController: UIViewController, PreViewTimerViewInput {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var gradientView: UIView!
    var output: PreViewTimerViewOutput!
    var type: timerType = .classic

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        style()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
    
    func style() {
        let gradientLayer = CAGradientLayer()
        switch type {
        case .classic:
            gradientLayer.colors = [UIColor.furyClassicGradientBot.cgColor, UIColor.furyClassicGradientTop.cgColor]
            logoImage.image = UIImage(named: "classic")
            playButton.setBackgroundColor(color: UIColor.furyPinkRed, forState: .normal)
        case .interval:
            gradientLayer.colors = [UIColor.furyIntervalGradientTop.cgColor, UIColor.furyIntervalGradientBot.cgColor]
            logoImage.image = UIImage(named: "interval")
            playButton.setBackgroundColor(color: UIColor.furyGoldenYellow, forState: .normal)
        case .countdown:
            gradientLayer.colors = [UIColor.furyCountdownGradientBot.cgColor, UIColor.furyCountdownGradientTop.cgColor]
            logoImage.image = UIImage(named: "countdown")
            playButton.setBackgroundColor(color: UIColor.furyBrightLavender, forState: .normal)
        }
        gradientLayer.frame = self.view.bounds
        gradientView.layer.insertSublayer(gradientLayer, at: 0)
    }

    @IBAction func closeButtonPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playButtonPress(_ sender: Any) {
        
    }
    
    // MARK: PreViewTimerViewInput
    func setupInitialState() {
    }
}
