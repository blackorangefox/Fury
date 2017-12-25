//
//  ClassicTimerClassicTimerAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 24/08/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class TimerAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(TimerViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "TimerViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "TimerViewController") as! TimerViewController
            controller.output = resolver.resolve(TimerViewOutput.self, argument: (controller as TimerViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(TimerViewOutput.self, factory: { (resolver: Resolver, view: TimerViewInput) in
            let presenter = TimerPresenter()
            presenter.router = resolver.resolve(TimerRouterInput.self, argument: (view as! UIViewController))
            presenter.flowStory = resolver.resolve(TimerStoryProtocol.self)
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)
    
        cont.register(TimerRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = TimerRouter()
            router.view = view
            return router
        }.inObjectScope(.transient)
    }
}
