//
//  PreStartController.swift
//  Fury
//
//  Created by Mikhail Fokin on 16/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import iCarousel

class PreStartController: UIViewController, iCarouselDataSource, iCarouselDelegate {
 
    private let playerService = PlayerService()
    var items: [String] = ["10",
                           "9",
                           "8",
                           "7",
                           "6",
                           "5",
                           "4",
                           "3",
                           "2",
                           "1",
                           "GO"]
    var currentIndex = 1
    var timer: Timer!
    var type: TimerType = .classic
    
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bottomGradientViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarousel()
        showInformationViewIfNeeded()
        subscribeScreenRotate()
    
        switch type {
        case .classic:
            gradientView.backgroundColor = UIColor.furyPinkRed
        case .interval:
            gradientView.backgroundColor = UIColor.furyGoldenYellow
        case .countdown:
            gradientView.backgroundColor = UIColor.furyBrightLavender
        }
    }
    
    func subscribeScreenRotate() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PreStartController.rotated),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    func setupCarousel() {
        carousel.type = .linear
        carousel.isVertical = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let aSelector = #selector(PreStartController.updateSelectCell)
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: aSelector,
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc func updateSelectCell() {
        if self.currentIndex == self.items.count {
            timer.invalidate()
            closeButtonPress(self)
            let vc = GlobalAssembly.resolve(type: TimerViewInput.self) as! UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            self.carousel.scrollToItem(at: self.currentIndex, animated: true)
            self.currentIndex += 1
        }
    }
    
    func carouselWillBeginScrollingAnimation(_ carousel: iCarousel) {
        let oldView = carousel.currentItemView as? UILabel
        oldView?.textColor = UIColor.white.withAlphaComponent(0.1)
    }
    
    func carouselDidEndScrollingAnimation(_ carousel: iCarousel) {
        let view = carousel.currentItemView as? UILabel
        if carousel.currentItemIndex == items.count-1 {
            switch type {
            case .classic:
                view?.textColor = UIColor.furyPinkRed
            case .interval:
                view?.textColor = UIColor.furyGoldenYellow
            case .countdown:
                view?.textColor = UIColor.furyBrightLavender
            }
        } else {
            view?.textColor = .white
        }
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
            label = UILabel(frame: CGRect(x: 0, y: 0, width: screenRect.width, height: screenRect.height/2))
            label.textAlignment = .center
            label.font = UIFont.furyCountdownNumbers
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
    
    @IBAction func closeButtonPress(_ sender: Any) {
        bottomGradientViewConstraint.constant = -600
        UIView.animate(withDuration: 0.3) {
            self.gradientView.layoutIfNeeded()
        }
        UserDefaults.standard.set(true, forKey: "alreadyShown")
    }
    
    func showInformationViewIfNeeded() {
        if !UserDefaults.standard.bool(forKey: "alreadyShown") {
            bottomGradientViewConstraint.constant = 24
            UIView.animate(withDuration: 0.3) {
                self.gradientView.layoutIfNeeded()
            }
        } else {
            bottomGradientViewConstraint.constant = -600
        }
    }
    
    @objc func rotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            closeButtonPress(self)
        }
        
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            print("Portrait")
        }
        
    }
    
}


