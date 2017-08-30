//
//  IntervalTimerIntervalTimerAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 18/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class IntervalTimerAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(IntervalTimerViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "IntervalTimerViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "IntervalTimerViewController") as! IntervalTimerViewController
            controller.output = resolver.resolve(IntervalTimerViewOutput.self, argument: (controller as IntervalTimerViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(IntervalTimerViewOutput.self, factory: { (resolver: Resolver, view: IntervalTimerViewInput) in
            let presenter = IntervalTimerPresenter()
            presenter.interactor = resolver.resolve(IntervalTimerInteractorInput.self, argument: (presenter as IntervalTimerInteractorOutput))
            presenter.router = resolver.resolve(IntervalTimerRouterInput.self, argument: (view as! UIViewController))
            presenter.view = view
            presenter.intervalTimerStory = resolver.resolve(IntervalTimerStoryProtocol.self)
            presenter.timerService = resolver.resolve(TimerServiceProtocol.self)
            return presenter
        }).inObjectScope(.transient)

        cont.register(IntervalTimerInteractorInput.self) { (resolver: Resolver, presenter: IntervalTimerInteractorOutput) in
            let interactor = IntervalTimerInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(IntervalTimerRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = IntervalTimerRouter()
            router.viewController = view
            return router
        }.inObjectScope(.transient)
    }
}
