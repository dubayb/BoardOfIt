//
//  AppDelegate.swift
//  GameTrader
//
//  Created by Bryan Dubay on 9/20/18.
//  Copyright © 2018 Bryan Dubay. All rights reserved.
//


import UIKit
import FirebaseUI
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var services: [Servicing] = [
        AnalyticsService(),
        LocationService(),
        UserDataBaseService()
    ]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Initialize all services
        for service in self.services {
            service.configure()
        }
        checkToShowOnboarding()
        return true
    }
    // TODO: switch to Factory pattern
    func checkToShowOnboarding() {
        let firstAppRun = UserDefaults.standard.bool(forKey: "ShowOnboarding")
        
        guard !firstAppRun , Auth.auth().currentUser == nil , !BGGUser.shared.isBGGUserLoggedIn() else {
            return
        }
        
        if let tab = self.window?.rootViewController as? UITabBarController {
            if let firstViewController = tab.viewControllers?[0] {
                firstViewController.performSegue(withIdentifier: "ShowOnBoarding", sender: self)
            }
        }
        
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
        // Saves changes in the application's managed object context before the application terminates.
    }
    
    
}
protocol Servicing {
    func configure()
}
