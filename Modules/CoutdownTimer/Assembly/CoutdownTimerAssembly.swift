//
//  CoutdownTimerCoutdownTimerAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 31/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class CoutdownTimerAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(CoutdownTimerViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "CoutdownTimerView", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "CoutdownTimerView") as! CoutdownTimerViewController
            controller.output = resolver.resolve(CoutdownTimerViewOutput.self, argument: (controller as CoutdownTimerViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(CoutdownTimerViewOutput.self, factory: { (resolver: Resolver, view: CoutdownTimerViewInput) in
            let presenter = CoutdownTimerPresenter()
            presenter.interactor = resolver.resolve(CoutdownTimerInteractorInput.self, argument: (presenter as CoutdownTimerInteractorOutput))
            presenter.router = resolver.resolve(CoutdownTimerRouterInput.self, argument: (view as! UIViewController))
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)

        cont.register(CoutdownTimerInteractorInput.self) { (resolver: Resolver, presenter: CoutdownTimerInteractorOutput) in
            let interactor = CoutdownTimerInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(CoutdownTimerRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = CoutdownTimerRouter()
            router.view = view
            return router
        }.inObjectScope(.transient)
    }
}
