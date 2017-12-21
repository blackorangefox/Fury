//
//  PreStartController.swift
//  Fury
//
//  Created by Mikhail Fokin on 16/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import iCarousel

class PreStartController: UIViewController {
 
    
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
    var style: TimerStyle!
    var ddm: CarouselDDM!
    
    private let playerService = PlayerService()
    
    @IBOutlet weak var carousel: iCarousel!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bottomGradientViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarousel()
        showInformationViewIfNeeded()
        subscribeScreenRotate()
        gradientView.backgroundColor = style.mainColor
    }
    
    
    
    func subscribeScreenRotate() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PreStartController.rotated),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    func setupCarousel() {
        ddm = CarouselDDM(items: items)
        ddm.style = style
        carousel.delegate = ddm
        carousel.dataSource = ddm
        carousel.type = .linear
        carousel.isVertical = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let aSelector = #selector(PreStartController.updateSelectCell)
        //playerService.playOneSecond()
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: aSelector,
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc func updateSelectCell() {
        if self.currentIndex == self.items.count {
            playerService.playStartWork()
            timer.invalidate()
            closeButtonPress(self)
            let vc = GlobalAssembly.resolve(type: TimerViewInput.self) as! UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            if self.currentIndex > self.items.count-4 {
               // playerService.playOneSecond()
                print("play sound "+Date().timeString(ofStyle: .full))
            }
        
            self.carousel.scrollToItem(at: self.currentIndex, animated: true)
            print("Chnage item "+Date().timeString(ofStyle: .full)+" "+(carousel.currentItemView as! UILabel).text!)
            self.currentIndex += 1
        }
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


