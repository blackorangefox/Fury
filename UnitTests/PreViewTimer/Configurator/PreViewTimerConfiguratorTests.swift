//
//  PreViewTimerPreViewTimerConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class PreViewTimerModuleConfiguratorTests: XCTestCase {

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
        let viewController = PreViewTimerViewControllerMock()
        let configurator = PreViewTimerModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "PreViewTimerViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PreViewTimerPresenter, "output is not PreViewTimerPresenter")

        let presenter: PreViewTimerPresenter = viewController.output as! PreViewTimerPresenter
        XCTAssertNotNil(presenter.view, "view in PreViewTimerPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PreViewTimerPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PreViewTimerRouter, "router is not PreViewTimerRouter")

        let interactor: PreViewTimerInteractor = presenter.interactor as! PreViewTimerInteractor
        XCTAssertNotNil(interactor.output, "output in PreViewTimerInteractor is nil after configuration")
    }

    class PreViewTimerViewControllerMock: PreViewTimerViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
