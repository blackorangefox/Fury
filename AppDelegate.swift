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
import UserNotifications
import Mixpanel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    let container = Container()
    var timerService: TimerServiceProtocol!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.isIdleTimerDisabled = true
        GlobalAssembly.configure()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        timerService = GlobalAssembly.resolve(type: TimerServiceProtocol.self)
       let vc = GlobalAssembly.resolve(type: MainViewViewInput.self) as! UIViewController
        
       // let story = UIStoryboard.init(name: "Main", bundle: nil)
      //  let preScreen  = story.instantiateViewController(withIdentifier: "PreStartController") as! PreStartController
        
        self.window?.rootViewController = vc//preScreen
        self.window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        if !UserDefaults.standard.bool(forKey: "FirstLaunch") {
           UserDefaults.standard.set(true, forKey: "FirstLaunch")
           UserDefaults.standard.set(Date(), forKey: "TimeForSurvey")
        }
        Mixpanel.initialize(token: "45945acf55ce497604e2dc20e6952d30")
        return true
    } 

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.sound])
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }


}

