//
//  MainViewMainViewConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class MainViewModuleConfiguratorTests: XCTestCase {

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
        let viewController = MainViewViewControllerMock()
        let configurator = MainViewModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "MainViewViewController is nil after configuration")
        XCTAssertTrue(viewController.output is MainViewPresenter, "output is not MainViewPresenter")

        let presenter: MainViewPresenter = viewController.output as! MainViewPresenter
        XCTAssertNotNil(presenter.view, "view in MainViewPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in MainViewPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is MainViewRouter, "router is not MainViewRouter")

        let interactor: MainViewInteractor = presenter.interactor as! MainViewInteractor
        XCTAssertNotNil(interactor.output, "output in MainViewInteractor is nil after configuration")
    }

    class MainViewViewControllerMock: MainViewViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
