//
//  MainViewMainViewViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class MainViewViewController: UIViewController, MainViewViewInput {

    @IBOutlet weak var controllerTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var output: MainViewViewOutput!
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return .portrait }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        setupTable()
        stylize()
    }
    
    func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func stylize() {
        controllerTitle.text = "Choose\ntimer type"
        controllerTitle.font = UIFont.furyHeadline1
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
        var type: timerType = .classic
        if indexPath.section == 1 {
            type = .interval
        }
        if indexPath.section == 2 {
            type = .countdown
        }
        self.output.openTimer(type: type)
    }
}
