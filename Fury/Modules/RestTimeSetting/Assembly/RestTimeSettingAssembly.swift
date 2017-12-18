//
//  RestTimeSettingRestTimeSettingAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 18/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class RestTimeSettingAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

    cont.register(TimeSettingViewInput.self, name: "RestTime") { resolver in
            let story = UIStoryboard.init(name: "TimeSettingViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "TimeSettingViewController") as! TimeSettingViewController
        controller.output = resolver.resolve(TimeSettingViewOutput.self, name: "RestTime", argument: (controller as TimeSettingViewInput))
            return controller
        }.inObjectScope(.transient)

    cont.register(TimeSettingViewOutput.self, name: "RestTime", factory: { (resolver: Resolver, view: TimeSettingViewInput) in
            let presenter = RestTimeSettingPresenter()
            presenter.interactor = resolver.resolve(RestTimeSettingInteractorInput.self, argument: (presenter as RestTimeSettingInteractorOutput))
            presenter.router = resolver.resolve(RestTimeSettingRouterInput.self, argument: (view as! UIViewController))
            presenter.flowStory = resolver.resolve(TimerStoryProtocol.self)
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)

        cont.register(RestTimeSettingInteractorInput.self) { (resolver: Resolver, presenter: RestTimeSettingInteractorOutput) in
            let interactor = RestTimeSettingInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(RestTimeSettingRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = RestTimeSettingRouter()
            router.view = view as? TimeSettingViewController
            return router
        }.inObjectScope(.transient)
    }
}
