//
//  TimeSettingTimeSettingViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import iCarousel

class TimeSettingViewController: UIViewController, TimeSettingViewInput {

    var output: TimeSettingViewOutput!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var minPicker: iCarousel!
    @IBOutlet weak var secPicker: iCarousel!
    @IBOutlet weak var nextButton: UIButton!
    
    let minutDDM = CarouselDDM(startIndex: 0, font: UIFont.furySmallPickerNumbersActive)
    let secindDDM = CarouselDDM(startIndex: 0, font: UIFont.furySmallPickerNumbersActive)
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return .portrait }
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        minPicker.delegate = minutDDM
        minPicker.dataSource = minutDDM
        
        secPicker.delegate = secindDDM
        secPicker.dataSource = secindDDM
        setupCarousel()
    }
    
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
    func setupCarousel() {
        minPicker.type = .linear
        minPicker.isVertical = true
        
        secPicker.type = .linear
        secPicker.isVertical = true
    }
    
    func stylez(style: TimerStyle) {
        nextButton.setBackgroundColor(color: style.mainColor, forState: .normal)
    }

    @IBAction func backButtonPress(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonPress(_ sender: Any) {
        output.selectWorkTime(minuts: self.minPicker.currentItemIndex,
                              seconds: self.secPicker.currentItemIndex)
    }
    
    // MARK: TimeSettingViewInput
    func setupInitialState() {
    }
}
