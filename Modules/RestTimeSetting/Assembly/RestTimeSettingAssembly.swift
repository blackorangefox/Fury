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

        cont.register(RestTimeSettingViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "RestTimeSettingView", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "RestTimeSettingView") as! RestTimeSettingViewController
            controller.output = resolver.resolve(RestTimeSettingViewOutput.self, argument: (controller as RestTimeSettingViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(RestTimeSettingViewOutput.self, factory: { (resolver: Resolver, view: RestTimeSettingViewInput) in
            let presenter = RestTimeSettingPresenter()
            presenter.interactor = resolver.resolve(RestTimeSettingInteractorInput.self, argument: (presenter as RestTimeSettingInteractorOutput))
            presenter.router = resolver.resolve(RestTimeSettingRouterInput.self, argument: (view as! UIViewController))
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
            router.view = view
            return router
        }.inObjectScope(.transient)
    }
}
