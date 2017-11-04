//
//  RootContainerController.swift
//  Fury
//
//  Created by Mikhail Fokin on 04/05/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit

protocol RootContainerControllerProtocol {
    func addSubview(_ viewController: UIViewController, container: UIView)
    func embeddedTransition(oldViewController: UIViewController, toViewController newViewController: UIViewController, container: UIView)
}

extension RootContainerControllerProtocol where Self: UIViewController {
    
    func addSubview(_ viewController: UIViewController, container: UIView) {
        addChildViewController(viewController)
        container.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints(for: viewController, in: container)
    }
    
    func embeddedTransition(oldViewController: UIViewController, toViewController newViewController: UIViewController, container: UIView) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubview(newViewController, container: container)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.1, animations: {
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
        },
                       completion: { finished in
                        oldViewController.view.removeFromSuperview()
                        oldViewController.removeFromParentViewController()
                        newViewController.didMove(toParentViewController: self)
        })
        
    }
    
    private func setupConstraints(for viewController: UIViewController, in container: UIView) {
        viewController.view.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        viewController.view.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        viewController.view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        viewController.view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
    }
}
