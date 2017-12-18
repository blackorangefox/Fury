//
//  TimeSettingTimeSettingAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class TimeSettingAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(TimeSettingViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "TimeSettingViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "TimeSettingViewController") as! TimeSettingViewController
            controller.output = resolver.resolve(TimeSettingViewOutput.self, argument: (controller as TimeSettingViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(TimeSettingViewOutput.self, factory: { (resolver: Resolver, view: TimeSettingViewInput) in
            let presenter = TimeSettingPresenter()
            presenter.interactor = resolver.resolve(TimeSettingInteractorInput.self, argument: (presenter as TimeSettingInteractorOutput))
            presenter.router = resolver.resolve(TimeSettingRouterInput.self, argument: (view as! UIViewController))
            presenter.flowStory = resolver.resolve(TimerStoryProtocol.self)
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)

        cont.register(TimeSettingInteractorInput.self) { (resolver: Resolver, presenter: TimeSettingInteractorOutput) in
            let interactor = TimeSettingInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(TimeSettingRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = TimeSettingRouter()
            router.view = view as? TimeSettingViewController
            return router
        }.inObjectScope(.transient)
    }
}
