//
//  PreViewTimerPreViewTimerViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class PreViewTimerViewController: UIViewController, PreViewTimerViewInput {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var gradientView: UIView!
    
    var output: PreViewTimerViewOutput!
    var style: TimerStyle!
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return .portrait }
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        mainView.backgroundColor = UIColor.furyBackgroundColor
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func herocu() {
        switch style.type {
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
    func stylize(by style: TimerStyle) {
        self.style = style
        herocu()
        let screenRect = UIScreen.main.bounds
        let size = CGSize(width: screenRect.width-48, height: screenRect.height-48)
        playButton.setBackgroundColor(color: style.mainColor, forState: .normal)
        gradientView.setGradienBackgroundBy(colors: style.gradientColor, size: size)
        logoImage.image = style.bigLogo
    }
    
    @IBAction func closeButtonPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playButtonPress(_ sender: Any) {
        output.playButtonPress()
    }
    
    // MARK: PreViewTimerViewInput
    func setupInitialState() {
    }
}
