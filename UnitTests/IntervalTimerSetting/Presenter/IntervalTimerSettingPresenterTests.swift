//
//  IntervalTimerSettingIntervalTimerSettingPresenterTests.swift
//  fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class IntervalTimerSettingPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: IntervalTimerSettingInteractorInput {

    }

    class MockRouter: IntervalTimerSettingRouterInput {

    }

    class MockViewController: IntervalTimerSettingViewInput {

        func setupInitialState() {

        }
    }
}
