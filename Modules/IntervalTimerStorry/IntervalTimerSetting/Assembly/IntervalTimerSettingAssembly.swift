//
//  IntervalTimerSettingIntervalTimerSettingAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 17/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class IntervalTimerSettingAssembly: BaseAssembly {

    static func configure() {
        
        let container = defaultContainer()
        
        container.register(IntervalTimerSettingViewInput.self) { r in
            let story = UIStoryboard.init(name: "IntervalTimerSettingViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "IntervalTimerSettingViewController") as! IntervalTimerSettingViewController
            controller.output = r.resolve(IntervalTimerSettingViewOutput.self, argument: (controller as IntervalTimerSettingViewInput))
            return controller
            }.inObjectScope(.transient)

        container.register(IntervalTimerSettingViewOutput.self, factory: { (r, view : IntervalTimerSettingViewInput) in
            let presenter = IntervalTimerSettingPresenter()
            presenter.view = view
            presenter.interactor = r.resolve(IntervalTimerSettingInteractorInput.self, argument: presenter as IntervalTimerSettingInteractorOutput)
            presenter.router = r.resolve(IntervalTimerSettingRouterInput.self, argument: view as! IntervalTimerSettingViewController)
            presenter.intervalTimerStory = r.resolve(IntervalTimerStoryProtocol.self)
            return presenter
        }).inObjectScope(ObjectScope.transient)
        
        container.register(IntervalTimerSettingInteractorInput.self, factory: { (r, presenter : IntervalTimerSettingInteractorOutput) in
            let interactor = IntervalTimerSettingInteractor()
            interactor.output = presenter
            return interactor
        }).inObjectScope(ObjectScope.transient)

        container.register(IntervalTimerSettingRouterInput.self, factory: { (r, view : IntervalTimerSettingViewController) in
            let router = IntervalTimerSettingRouter()
            router.viewController = view
            return router
        }).inObjectScope(ObjectScope.transient)
    }
}
