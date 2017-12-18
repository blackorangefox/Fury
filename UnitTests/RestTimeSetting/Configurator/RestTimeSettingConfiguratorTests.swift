//
//  RestTimeSettingRestTimeSettingConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 18/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class RestTimeSettingModuleConfiguratorTests: XCTestCase {

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
        let viewController = RestTimeSettingViewControllerMock()
        let configurator = RestTimeSettingModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "RestTimeSettingViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RestTimeSettingPresenter, "output is not RestTimeSettingPresenter")

        let presenter: RestTimeSettingPresenter = viewController.output as! RestTimeSettingPresenter
        XCTAssertNotNil(presenter.view, "view in RestTimeSettingPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in RestTimeSettingPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RestTimeSettingRouter, "router is not RestTimeSettingRouter")

        let interactor: RestTimeSettingInteractor = presenter.interactor as! RestTimeSettingInteractor
        XCTAssertNotNil(interactor.output, "output in RestTimeSettingInteractor is nil after configuration")
    }

    class RestTimeSettingViewControllerMock: RestTimeSettingViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
