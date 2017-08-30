//
//  IntervalTimerIntervalTimerViewController.swift
//  fury
//
//  Created by Mikhail Fokin on 18/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit

class IntervalTimerViewController: UIViewController, IntervalTimerViewInput {
    
    var output: IntervalTimerViewOutput!
    @IBOutlet weak var progressViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var colectionView: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var viewFinishAncContinue: UIView!
    @IBOutlet weak var viewFCconstraint: NSLayoutConstraint!
    @IBOutlet weak var finishButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var finishButton: UIButton!
    private var increment: IndexPath!
    var titleArray: [String] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progressViewConstraint.constant = -self.view.frame.width
    }
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        colectionView.dataSource = self
        colectionView.delegate = self
        self.increment = IndexPath(row: 0, section: 0)
        
        colectionView.performBatchUpdates(nil) { _ in
            self.collectionView(self.colectionView, didSelectItemAt: self.increment)
        }
    }
    
    func updateLapsTitle(titles: [String]) {
        titleArray = titles
        colectionView.reloadData()
    }
    
    func newTime(time: String) {
        timeLabel.text = time
    }
    
    func updateLine(width: CGFloat) {
        progressViewConstraint.constant = width
    }
    
    // MARK: IntervalTimerViewInput
    func setupInitialState() {
    }
    
    func nextSegment() {
        let current = increment!
        self.collectionView(colectionView, didDeselectItemAt: current)
        increment = IndexPath(row: current.row+1, section: current.section)
        colectionView.layoutIfNeeded()
        colectionView.scrollToItem(at: increment, at: .centeredHorizontally, animated: true)
        self.collectionView(colectionView, didSelectItemAt: increment)
    }
    
    func timerFinish() {
        finishButtonConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.finishButton.alpha = 1
        }
    }
    
    @IBAction func pauseButtonPress(_ sender: Any) {
        viewFCconstraint.constant = 0
        UIView.animate(withDuration: 0.3, animations: {
            self.viewFinishAncContinue.alpha = 1
        })
        self.output.pauseButtonPress()
    }
    
    @IBAction func finishButton(_ sender: Any) {
    }
    
    @IBAction func continuePress(_ sender: Any) {
        self.output.continuePress()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.viewFinishAncContinue.alpha = 0
        }) { (flag) in
            self.viewFCconstraint.constant = -65
        }
    }
    
}

extension IntervalTimerViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int  {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntervalNavigationCell", for: indexPath) as! IntervalNavigationCell
        cell.titleLabel.text = titleArray[indexPath.row]
        cell.titleLabel.textColor = UIColor.furyWhite5
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? IntervalNavigationCell
        cell?.titleLabel.textColor = UIColor.furyYellowGreen
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? IntervalNavigationCell
        cell?.titleLabel.textColor = UIColor.white
    }
}
