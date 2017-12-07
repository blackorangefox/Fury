//
//  PreViewTimerPreViewTimerAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 07/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class PreViewTimerAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(PreViewTimerViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "PreViewTimerViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "PreViewTimerViewController") as! PreViewTimerViewController
            controller.output = resolver.resolve(PreViewTimerViewOutput.self, argument: (controller as PreViewTimerViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(PreViewTimerViewOutput.self, factory: { (resolver: Resolver, view: PreViewTimerViewInput) in
            let presenter = PreViewTimerPresenter()
            presenter.interactor = resolver.resolve(PreViewTimerInteractorInput.self, argument: (presenter as PreViewTimerInteractorOutput))
            presenter.router = resolver.resolve(PreViewTimerRouterInput.self, argument: (view as! UIViewController))
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)

        cont.register(PreViewTimerInteractorInput.self) { (resolver: Resolver, presenter: PreViewTimerInteractorOutput) in
            let interactor = PreViewTimerInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(PreViewTimerRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = PreViewTimerRouter()
            router.view = view as? PreViewTimerViewController
            return router
        }.inObjectScope(.transient)
    }
}
