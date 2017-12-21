//
//  RoundSettingRoundSettingViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import iCarousel
import Mixpanel

class RoundSettingViewController: UIViewController, RoundSettingViewInput {

    var output: RoundSettingViewOutput!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var setsPicker: iCarousel!
    let ddm = CarouselDDM(startIndex: 1)
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return .portrait }
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setsPicker.delegate = ddm
        setsPicker.dataSource = ddm
        setupCarousel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Mixpanel.mainInstance().track(event: "Open Set setting")
    }
    
    func setupCarousel() {
        setsPicker.type = .linear
        setsPicker.isVertical = true
    }
    
    func stylez(style: TimerStyle) {
        nextButton.setBackgroundColor(color: style.mainColor, forState: .normal)
    }

    @IBAction func backButtonPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonPress(_ sender: Any) {
        output.selectSets(sets: self.setsPicker.currentItemIndex+1)
    }
    
    // MARK: RoundSettingViewInput
    func setupInitialState() {
    }
}
