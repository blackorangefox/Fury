//
//  ResultScreenResultScreenAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 13/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class ResultScreenAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(ResultScreenViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "ResultScreenViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "ResultScreenViewController") as! ResultScreenViewController
            controller.output = resolver.resolve(ResultScreenViewOutput.self, argument: (controller as ResultScreenViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(ResultScreenViewOutput.self, factory: { (resolver: Resolver, view: ResultScreenViewInput) in
            let presenter = ResultScreenPresenter()
            presenter.interactor = resolver.resolve(ResultScreenInteractorInput.self, argument: (presenter as ResultScreenInteractorOutput))
            presenter.router = resolver.resolve(ResultScreenRouterInput.self, argument: (view as! UIViewController))
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)

        cont.register(ResultScreenInteractorInput.self) { (resolver: Resolver, presenter: ResultScreenInteractorOutput) in
            let interactor = ResultScreenInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(ResultScreenRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = ResultScreenRouter()
            router.view = view as? ResultScreenViewController
            return router
        }.inObjectScope(.transient)
    }
}
