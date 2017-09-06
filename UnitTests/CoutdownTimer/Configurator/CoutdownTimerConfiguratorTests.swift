//
//  CoutdownTimerCoutdownTimerConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 31/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class CoutdownTimerModuleConfiguratorTests: XCTestCase {

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
        let viewController = CoutdownTimerViewControllerMock()
        let configurator = CoutdownTimerModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "CoutdownTimerViewController is nil after configuration")
        XCTAssertTrue(viewController.output is CoutdownTimerPresenter, "output is not CoutdownTimerPresenter")

        let presenter: CoutdownTimerPresenter = viewController.output as! CoutdownTimerPresenter
        XCTAssertNotNil(presenter.view, "view in CoutdownTimerPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in CoutdownTimerPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is CoutdownTimerRouter, "router is not CoutdownTimerRouter")

        let interactor: CoutdownTimerInteractor = presenter.interactor as! CoutdownTimerInteractor
        XCTAssertNotNil(interactor.output, "output in CoutdownTimerInteractor is nil after configuration")
    }

    class CoutdownTimerViewControllerMock: CoutdownTimerViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
