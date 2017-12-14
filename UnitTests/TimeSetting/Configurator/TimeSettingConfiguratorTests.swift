//
//  TimeSettingTimeSettingConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class TimeSettingModuleConfiguratorTests: XCTestCase {

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
        let viewController = TimeSettingViewControllerMock()
        let configurator = TimeSettingModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "TimeSettingViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TimeSettingPresenter, "output is not TimeSettingPresenter")

        let presenter: TimeSettingPresenter = viewController.output as! TimeSettingPresenter
        XCTAssertNotNil(presenter.view, "view in TimeSettingPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TimeSettingPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TimeSettingRouter, "router is not TimeSettingRouter")

        let interactor: TimeSettingInteractor = presenter.interactor as! TimeSettingInteractor
        XCTAssertNotNil(interactor.output, "output in TimeSettingInteractor is nil after configuration")
    }

    class TimeSettingViewControllerMock: TimeSettingViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
