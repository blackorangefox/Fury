//
//  IntervalTimerIntervalTimerViewInput.swift
//  fury
//
//  Created by Mikhail Fokin on 18/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//
import Foundation
import UIKit

protocol IntervalTimerViewInput: class {

    /**
        @author Mikhail Fokin
        Setup initial state of the view
    */

    func setupInitialState()
    func updateLapsTitle(titles: [String])
    func newTime(time: String)
    func nextSegment()
    func updateLine(width: CGFloat)
    func timerFinish()
}
