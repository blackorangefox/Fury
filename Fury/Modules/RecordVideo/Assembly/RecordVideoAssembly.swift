//
//  RecordVideoRecordVideoAssembly.swift
//  fury
//
//  Created by Mikhail Fokin on 25/12/2017.
//  Copyright © 2017 nova9. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

class RecordVideoAssembly: BaseAssembly {

static func configure() {
        let cont = defaultContainer()

        cont.register(RecordVideoViewInput.self) { resolver in
            let story = UIStoryboard.init(name: "RecordVideoViewController", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "RecordVideoViewController") as! RecordVideoViewController
            controller.output = resolver.resolve(RecordVideoViewOutput.self, argument: (controller as RecordVideoViewInput))
            return controller
        }.inObjectScope(.transient)

        cont.register(RecordVideoViewOutput.self, factory: { (resolver: Resolver, view: RecordVideoViewInput) in
            let presenter = RecordVideoPresenter()
            presenter.interactor = resolver.resolve(RecordVideoInteractorInput.self, argument: (presenter as RecordVideoInteractorOutput))
            presenter.router = resolver.resolve(RecordVideoRouterInput.self, argument: (view as! UIViewController))
            presenter.view = view
            return presenter
        }).inObjectScope(.transient)

        cont.register(RecordVideoInteractorInput.self) { (resolver: Resolver, presenter: RecordVideoInteractorOutput) in
            let interactor = RecordVideoInteractor()
            interactor.output = presenter
            return interactor
        }.inObjectScope(.transient)

        cont.register(RecordVideoRouterInput.self) { (resolver: Resolver, view: UIViewController) in
            let router = RecordVideoRouter()
            router.view = view as? RecordVideoViewController
            return router
        }.inObjectScope(.transient)
    }
}
