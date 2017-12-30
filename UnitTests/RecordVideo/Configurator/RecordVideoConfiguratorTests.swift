//
//  RecordVideoRecordVideoConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 25/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class RecordVideoModuleConfiguratorTests: XCTestCase {

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
        let viewController = RecordVideoViewControllerMock()
        let configurator = RecordVideoModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "RecordVideoViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RecordVideoPresenter, "output is not RecordVideoPresenter")

        let presenter: RecordVideoPresenter = viewController.output as! RecordVideoPresenter
        XCTAssertNotNil(presenter.view, "view in RecordVideoPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in RecordVideoPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RecordVideoRouter, "router is not RecordVideoRouter")

        let interactor: RecordVideoInteractor = presenter.interactor as! RecordVideoInteractor
        XCTAssertNotNil(interactor.output, "output in RecordVideoInteractor is nil after configuration")
    }

    class RecordVideoViewControllerMock: RecordVideoViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
