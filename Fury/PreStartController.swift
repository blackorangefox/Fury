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
                           "GO",
                           ""]
    var currentIndex = 0
    var timer: Timer!
    var style: TimerStyle!
    var ddm: CarouselDDM!
    
    private let playerService = PlayerService()
    @IBOutlet weak var countDownTable: UITableView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var bottomGradientViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCarousel()
        showInformationViewIfNeeded()
        subscribeScreenRotate()
        // gradientView.backgroundColor = style.mainColor
    }
    
    
    
    func subscribeScreenRotate() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PreStartController.rotated),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    func setupCarousel() {
        countDownTable.delegate = self
        countDownTable.dataSource = self
        countDownTable.register(cellType: NumberCell.self)
        let contentOffset = CGPoint(x: 0, y: -UIScreen.main.bounds.height/3)
        DispatchQueue.main.async {
            self.countDownTable.setContentOffset(contentOffset, animated: false)
        }
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
        self.currentIndex += 1
        if self.currentIndex == self.items.count-2 {
            print("Play final")
            playerService.playStartWork()
            let indePath = IndexPath(item: currentIndex, section: 0)
            countDownTable.scrollToRow(at: indePath, at: .middle, animated: true)
            timer.invalidate()
            closeButtonPress(self)
            let vc = GlobalAssembly.resolve(type: TimerViewInput.self) as! UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            if self.currentIndex > self.items.count-6 {
                playerService.playOneSecond()
                print("Play sound")
          }
            let indePath = IndexPath(item: currentIndex, section: 0)
            countDownTable.scrollToRow(at: indePath, at: .middle, animated: true)
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

extension PreStartController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height/3
    }
}

extension PreStartController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell") as! NumberCell
        cell.numberLabel.text = items[indexPath.row]
        cell.numberLabel.textAlignment = .center
        cell.numberLabel.font = UIFont.furyPickerNumbersActive
        cell.numberLabel.textColor = UIColor.white.withAlphaComponent(0.1)
        return cell
    }
}
