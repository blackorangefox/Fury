//
//  AppDelegate.swift
//  Fury
//
//  Created by Mikhail Fokin on 29/04/2017.
//  Copyright © 2017 Mikhail Fokin. All rights reserved.
//

import UIKit
import Firebase
import Swinject
import Foundation
import Hero

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let container = Container()
    var timerService: TimerServiceProtocol!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.isIdleTimerDisabled = true
        GlobalAssembly.configure()
        
        timerService = GlobalAssembly.resolve(type: TimerServiceProtocol.self)
        
        let vc = GlobalAssembly.resolve(type: ClassicTimerViewInput.self) as! UIViewController
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.isNavigationBarHidden = true
        navigationController.isHeroEnabled = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        if !UserDefaults.standard.bool(forKey: "FirstLaunch") {
           UserDefaults.standard.set(true, forKey: "FirstLaunch")
           UserDefaults.standard.set(Date(), forKey: "TimeForSurvey")
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        timerService.applicationDidEnterBackground()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        timerService.applicationDidBecomeActive()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

