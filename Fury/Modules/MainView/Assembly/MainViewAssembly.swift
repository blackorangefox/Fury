//
//  MainViewMainViewAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class MainViewAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(MainViewViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "MainViewViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "MainViewViewController") as! MainViewViewController
            controller.output = resolver.resolve(MainViewViewOutput.self, argument: (controller as MainViewViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(MainViewViewOutput.self, factory: { (resolver: Resolver, view: MainViewViewInput) in
            let presenter = MainViewPresenter()
            presenter.interactor = resolver.resolve(MainViewInteractorInput.self, argument: (presenter as MainViewInteractorOutput))
            presenter.router = resolver.resolve(MainViewRouterInput.self, argument: (view as! UIViewController))
            presenter.view = view
            presenter.flowStory = resolver.resolve(TimerStoryProtocol.self)
            return presenter
        }).inObjectScope(.transient)

        cont.register(MainViewInteractorInput.self) { (resolver: Resolver, presenter: MainViewInteractorOutput) in
            let interactor = MainViewInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(MainViewRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = MainViewRouter()
            router.view = view as? MainViewViewController
            return router
        }.inObjectScope(.transient)
    }
}
