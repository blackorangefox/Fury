//
//  IntervalTimerIntervalTimerConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 18/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class IntervalTimerModuleConfiguratorTests: XCTestCase {

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
        let viewController = IntervalTimerViewControllerMock()
        let configurator = IntervalTimerModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "IntervalTimerViewController is nil after configuration")
        XCTAssertTrue(viewController.output is IntervalTimerPresenter, "output is not IntervalTimerPresenter")

        let presenter: IntervalTimerPresenter = viewController.output as! IntervalTimerPresenter
        XCTAssertNotNil(presenter.view, "view in IntervalTimerPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in IntervalTimerPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is IntervalTimerRouter, "router is not IntervalTimerRouter")

        let interactor: IntervalTimerInteractor = presenter.interactor as! IntervalTimerInteractor
        XCTAssertNotNil(interactor.output, "output in IntervalTimerInteractor is nil after configuration")
    }

    class IntervalTimerViewControllerMock: IntervalTimerViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
