//
//  IntervalTimerSettingIntervalTimerSettingConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class IntervalTimerSettingModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = IntervalTimerSettingViewControllerMock()
        let configurator = IntervalTimerSettingModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "IntervalTimerSettingViewController is nil after configuration")
        XCTAssertTrue(viewController.output is IntervalTimerSettingPresenter, "output is not IntervalTimerSettingPresenter")

        let presenter: IntervalTimerSettingPresenter = viewController.output as! IntervalTimerSettingPresenter
        XCTAssertNotNil(presenter.view, "view in IntervalTimerSettingPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in IntervalTimerSettingPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is IntervalTimerSettingRouter, "router is not IntervalTimerSettingRouter")

        let interactor: IntervalTimerSettingInteractor = presenter.interactor as! IntervalTimerSettingInteractor
        XCTAssertNotNil(interactor.output, "output in IntervalTimerSettingInteractor is nil after configuration")
    }

    class IntervalTimerSettingViewControllerMock: IntervalTimerSettingViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
