//
//  IntervanNavigationController.swift
//  Fury
//
//  Created by Mikhail Fokin on 12/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

class IntervalNavigationController: UIViewController {

    @IBOutlet weak var colectionView: UICollectionView!
    private var increment: IndexPath!
    var titleArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colectionView.dataSource = self
        colectionView.delegate = self

        colectionView.performBatchUpdates(nil) { _ in
             self.increment = IndexPath(row: 0, section: 0)
            self.collectionView(self.colectionView, didSelectItemAt: self.increment)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func nextSegment() {
        let current = increment!
        self.collectionView(colectionView, didDeselectItemAt: current)
        increment = IndexPath(row: current.row+1, section: current.section)
        colectionView.layoutIfNeeded()
        colectionView.scrollToItem(at: increment, at: .centeredHorizontally, animated: true)
        self.collectionView(colectionView, didSelectItemAt: increment)
    }
    
}

extension IntervalNavigationController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
