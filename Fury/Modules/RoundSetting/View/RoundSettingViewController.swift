//
//  RoundSettingRoundSettingViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import iCarousel

class RoundSettingViewController: UIViewController, RoundSettingViewInput {

    var output: RoundSettingViewOutput!
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var setsPicker: iCarousel!
    let ddm = CarouselDDM(startIndex: 1)
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setsPicker.delegate = ddm
        setsPicker.dataSource = ddm
        setupCarousel()
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

class CarouselDDM: NSObject, iCarouselDataSource, iCarouselDelegate {
    
    var items: [String] = []
    var font: UIFont
    
    init(startIndex: Int, font: UIFont = UIFont.furyPickerNumbersActive) {
        for i in startIndex...100 {
            items.append(String(format: "%02d", i))
        }
        self.font = font
    }
    
    func carouselWillBeginScrollingAnimation(_ carousel: iCarousel) {
        let oldView = carousel.currentItemView as? UILabel
        oldView?.textColor = UIColor.white.withAlphaComponent(0.1)
    }
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        let index = carousel.currentItemIndex-1
        let oldView = carousel.itemView(at: index) as? UILabel
        oldView?.textColor = UIColor.white.withAlphaComponent(0.1)
        let view = carousel.currentItemView as? UILabel
        view?.textColor = .white
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return items.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel {
            label = view
            label.textColor = UIColor.white.withAlphaComponent(0.1)
        } else {
            let screenRect = UIScreen.main.bounds
            label = UILabel(frame: CGRect(x: 0, y: 0, width: screenRect.width, height: carousel.height/3))
            label.textAlignment = .center
            label.font = font
            label.textColor = UIColor.white.withAlphaComponent(0.1)
        }
        label.text = items[index]
        return label
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
}


