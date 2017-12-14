//
//  RoundSettingRoundSettingConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class RoundSettingModuleConfiguratorTests: XCTestCase {

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
        let viewController = RoundSettingViewControllerMock()
        let configurator = RoundSettingModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "RoundSettingViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RoundSettingPresenter, "output is not RoundSettingPresenter")

        let presenter: RoundSettingPresenter = viewController.output as! RoundSettingPresenter
        XCTAssertNotNil(presenter.view, "view in RoundSettingPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in RoundSettingPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RoundSettingRouter, "router is not RoundSettingRouter")

        let interactor: RoundSettingInteractor = presenter.interactor as! RoundSettingInteractor
        XCTAssertNotNil(interactor.output, "output in RoundSettingInteractor is nil after configuration")
    }

    class RoundSettingViewControllerMock: RoundSettingViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
