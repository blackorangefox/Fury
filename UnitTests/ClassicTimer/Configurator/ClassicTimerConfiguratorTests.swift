//
//  ClassicTimerClassicTimerConfiguratorTests.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import XCTest

class ClassicTimerModuleConfiguratorTests: XCTestCase {

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
        let viewController = ClassicTimerViewControllerMock()
        let configurator = ClassicTimerModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "ClassicTimerViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ClassicTimerPresenter, "output is not ClassicTimerPresenter")

        let presenter: ClassicTimerPresenter = viewController.output as! ClassicTimerPresenter
        XCTAssertNotNil(presenter.view, "view in ClassicTimerPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ClassicTimerPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ClassicTimerRouter, "router is not ClassicTimerRouter")

        let interactor: ClassicTimerInteractor = presenter.interactor as! ClassicTimerInteractor
        XCTAssertNotNil(interactor.output, "output in ClassicTimerInteractor is nil after configuration")
    }

    class ClassicTimerViewControllerMock: ClassicTimerViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
