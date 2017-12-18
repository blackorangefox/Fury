//
//  RoundSettingRoundSettingViewOutput.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol RoundSettingViewOutput {

    /**
        @author Mikhail Fokin
        Notify presenter that view is ready
    */

    func viewIsReady()
    func selectSets(sets: Int)
}
