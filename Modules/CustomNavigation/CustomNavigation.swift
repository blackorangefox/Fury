//
//  CustomNavigation.swift
//  Fury
//
//  Created by Mikhail Fokin on 30/08/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import Foundation
import UIKit

enum CustomNavigationState: Int {
    case classic = 0
    case interval = 1
    case countDown = 2
}

class CustomNavigationCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

class CustomNavigation: UIViewController, CustomNavigationProtocol, RootContainerControllerProtocol {
    @IBOutlet weak var mainContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    var classicTimerController: UINavigationController!
    var intervalTimerController: UINavigationController!
    var countdownTimerController: UINavigationController!
    weak var currentViewController: UINavigationController!
    private var selectIndexPath: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        classicTimerController = initClassicTimerController()
        intervalTimerController = initIntervalTimerController()
        countdownTimerController = initCountdownTimerControlle()
        
        self.addSubview(classicTimerController, container: mainContainer)
        currentViewController = classicTimerController
    }
    
    func initClassicTimerController() -> UINavigationController {
        let controller = GlobalAssembly.resolve(type: ClassicTimerViewInput.self) as! UIViewController
        return createNavigation(vc: controller)
    }
    
    func initIntervalTimerController() -> UINavigationController {
        let controller = GlobalAssembly.resolve(type: IntervalTimerSettingViewInput.self) as! UIViewController
        return createNavigation(vc: controller)
    }
    
    func initCountdownTimerControlle() -> UINavigationController {
        let controller = GlobalAssembly.resolve(type: CoutdownTimerViewInput.self) as! UIViewController
        return createNavigation(vc: controller)
    }
    
    func createNavigation(vc: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.isNavigationBarHidden = true
        navigationController.isHeroEnabled = true
        return navigationController
    }
    
    func classicTimerButtonPress() {
        changeControllerTo(vc: classicTimerController)
    }
    
    func intervalTimerButtonPress() {
        changeControllerTo(vc: intervalTimerController)
    }
    
    func countdownTimerButtonPress() {
        changeControllerTo(vc: countdownTimerController)
    }
    
    func changeControllerTo(vc: UINavigationController) {
        embeddedTransition(oldViewController: currentViewController, toViewController: vc, container: mainContainer)
        self.currentViewController = vc
    }
}

extension CustomNavigation: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomNavigationCell", for: indexPath) as! CustomNavigationCell
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "CLASSIC"
        case 1:
            cell.titleLabel.text = "INTERVAL"
        default:
            cell.titleLabel.text = "COUNTDOWN"
        }
        if indexPath == selectIndexPath {
            selectCell(cell: cell)
        }else {
            deSelect(cell: cell)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize.zero
        switch indexPath.row {
        case 0:
            size = "CLASSIC".size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 28, weight: .bold)])
        case 1:
            size = "INTERVAL".size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 28, weight: .bold)])
        default:
            size = "COUNTDOWN".size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 28, weight: .bold)])
        }
        return CGSize(width: size.width+20, height: 62)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)  {
        if let cell = collectionView.cellForItem(at: indexPath) as? CustomNavigationCell {
            deSelect(cell: cell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt: IndexPath) {
        if let deselectCell = collectionView.cellForItem(at: selectIndexPath) as? CustomNavigationCell {
               deSelect(cell: deselectCell)
        }
        let cell = collectionView.cellForItem(at: didSelectItemAt) as! CustomNavigationCell
        selectCell(cell: cell)
        selectIndexPath = didSelectItemAt
        collectionView.scrollToItem(at: didSelectItemAt, at: .left, animated: true)
        switch didSelectItemAt.row {
        case 0:
            classicTimerButtonPress()
        case 1:
            intervalTimerButtonPress()
        default:
           countdownTimerButtonPress()
        }
    }
    
    func selectCell(cell: CustomNavigationCell) {
        cell.titleLabel.textColor = UIColor.furyYellowGreen
    }
    
    func deSelect(cell: CustomNavigationCell) {
        cell.titleLabel.textColor = UIColor.white.withAlphaComponent(0.3)
    }
}
