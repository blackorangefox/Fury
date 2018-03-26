//
//  SettingTimerController.swift
//  Fury
//
//  Created by Mikhail Fokin on 23/03/2018.
//  Copyright © 2018 Mikhail Fokin. All rights reserved.
//

import UIKit

struct SettingTimerModuleConfigure: ModuleConfiguration {
    let timerType: TimerType
}

class SettingTimerController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var timerType: TimerType = .classic
    private var models = [SettingTimerCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        switch timerType {
        case .interval:
            let roundModel =  SettingTimerCellModel(label: "TOTAL ROUNDS", textField: "1 rounds", type: .round)
            let workDuractionModel = SettingTimerCellModel(label: "WORK DURACTION", textField: "00:00:00", type: .hourseMinSec)
            let restDuractionModel = SettingTimerCellModel(label: "REST DURACTION", textField: "00:00:00", type: .hourseMinSec)
            models = [roundModel, workDuractionModel, restDuractionModel]
        case .classic:
            models = [SettingTimerCellModel]()
        case .countdown:
            let workDuractionModel = SettingTimerCellModel(label: "WORK DURACTION", textField: "00:00:00", type: .hourseMinSec)
            models = [workDuractionModel]
        }
    }
}

extension SettingTimerController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return models.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTimerCell", for: indexPath) as! SettingTimerCell
        var model = SettingTimerCellModel(label: "COUNTDOWN", textField: "1 second", type: .hourseMinSec)
        switch indexPath.section {
        case 0:
            model = SettingTimerCellModel(label: "COUNTDOWN", textField: "1 second", type: .sec)
        default:
            model = models[indexPath.row]
        }
        cell.configure(model: model)
        return cell
    }
}

extension SettingTimerController: ModuleConfigurable {
    func configure(with configuration: ModuleConfiguration) {
        guard let  configuration = configuration as? SettingTimerModuleConfigure else {
            return
        }
        self.timerType = configuration.timerType
    }
}
