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

class ClassicTimerAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(ClassicTimerViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "ClassicTimerViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "ClassicTimerViewController") as! ClassicTimerViewController
            controller.output = resolver.resolve(ClassicTimerViewOutput.self, argument: (controller as ClassicTimerViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(ClassicTimerViewOutput.self, factory: { (resolver: Resolver, view: ClassicTimerViewInput) in
            let presenter = ClassicTimerPresenter()
            presenter.router = resolver.resolve(ClassicTimerRouterInput.self, argument: (view as! UIViewController))
            presenter.timerService = resolver.resolve(TimerServiceProtocol.self)
            presenter.flowStory = resolver.resolve(IntervalTimerStoryProtocol.self)
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)
    
        cont.register(ClassicTimerRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = ClassicTimerRouter()
            router.view = view
            return router
        }.inObjectScope(.transient)
    }
}
