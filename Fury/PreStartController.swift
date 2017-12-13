//
//  PreStartController.swift
//  Fury
//
//  Created by Mikhail Fokin on 16/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
protocol PreStartControllerDelegate: class {
    func countdownFinish()
}

class PreStartController: UIViewController {
    
    weak var delegate: PreStartControllerDelegate!
    private let playerService = PlayerService()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentOffset = CGPoint(x: 0, y: -self.view.height)
    }
}

extension PreStartController: UICollectionViewDelegate {
    
}

extension PreStartController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PreStartCell", for: indexPath) as! PreStartCell
        cell.label.text = "\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.width, height: self.view.height/2+20)
    }
}
