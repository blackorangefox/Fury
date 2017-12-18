//
//  RoundSettingRoundSettingAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 14/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class RoundSettingAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(RoundSettingViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "RoundSettingViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "RoundSettingViewController") as! RoundSettingViewController
            controller.output = resolver.resolve(RoundSettingViewOutput.self, argument: (controller as RoundSettingViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(RoundSettingViewOutput.self, factory: { (resolver: Resolver, view: RoundSettingViewInput) in
            let presenter = RoundSettingPresenter()
            presenter.interactor = resolver.resolve(RoundSettingInteractorInput.self, argument: (presenter as RoundSettingInteractorOutput))
            presenter.router = resolver.resolve(RoundSettingRouterInput.self, argument: (view as! UIViewController))
            presenter.view = view
            presenter.flowStory = resolver.resolve(TimerStoryProtocol.self)
            return presenter
        }).inObjectScope(.transient)

        cont.register(RoundSettingInteractorInput.self) { (resolver: Resolver, presenter: RoundSettingInteractorOutput) in
            let interactor = RoundSettingInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(RoundSettingRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = RoundSettingRouter()
            router.view = view as? RoundSettingViewController
            return router
        }.inObjectScope(.transient)
    }
}
