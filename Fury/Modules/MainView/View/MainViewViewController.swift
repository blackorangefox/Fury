//
//  MainViewMainViewViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Mixpanel

class MainViewViewController: UIViewController, MainViewViewInput {

    @IBOutlet weak var controllerTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var output: MainViewViewOutput!
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return .portrait }
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        get { return .portrait }
    }
    
    override var shouldAutorotate: Bool {
        get {return false}
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupTable()
        stylize()
        subscribeScreenRotate()
    }
    
    func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func stylize() {
        controllerTitle.text = "Choose\ntimer type"
        controllerTitle.font = UIFont.furyHeadline1
    }
    
    func subscribeScreenRotate() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(MainViewViewController.rotated),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }

    // MARK: MainViewViewInput
    func setupInitialState() {
    }
    
}

extension MainViewViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimerTypeCell") as! TimerTypeCell
        if indexPath.section == 0 {
            cell.type = .classic
            cell.heroID = "classicView"
            cell.logoImage.heroID = "classicLogo"
        }
        if indexPath.section == 1 {
            cell.type = .interval
            cell.heroID = "intervalView"
            cell.logoImage.heroID = "intervalLogo"
        }
        if indexPath.section == 2 {
            cell.type = .countdown
            cell.heroID = "countdownView"
            cell.logoImage.heroID = "countdownLogo"
        }
        return cell
    }
    
    @objc func rotated() {
        tableView.reloadData()
    }
    
}

extension MainViewViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var type: TimerType = .classic
        switch indexPath.section {
        case 1:
            type = .interval
            Mixpanel.mainInstance().track(event: "open interval timer")
        case 2:
            type = .countdown
            Mixpanel.mainInstance().track(event: "open countdown timer")
        default:
            Mixpanel.mainInstance().track(event: "open classic timer")
        }
        self.output.openTimer(type: type)
    }
}
