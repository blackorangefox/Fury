//
//  TimeSettingTimeSettingViewOutput.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

protocol TimeSettingViewOutput {

    /**
        @author Mikhail Fokin
        Notify presenter that view is ready
    */

    func viewIsReady()
    func selectWorkTime(minuts: Int,
                        seconds: Int)
}
