//
//  ResultScreenResultScreenConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 13/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class ResultScreenModuleConfiguratorTests: XCTestCase {

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
        let viewController = ResultScreenViewControllerMock()
        let configurator = ResultScreenModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ResultScreenViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ResultScreenPresenter, "output is not ResultScreenPresenter")

        let presenter: ResultScreenPresenter = viewController.output as! ResultScreenPresenter
        XCTAssertNotNil(presenter.view, "view in ResultScreenPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ResultScreenPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ResultScreenRouter, "router is not ResultScreenRouter")

        let interactor: ResultScreenInteractor = presenter.interactor as! ResultScreenInteractor
        XCTAssertNotNil(interactor.output, "output in ResultScreenInteractor is nil after configuration")
    }

    class ResultScreenViewControllerMock: ResultScreenViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
