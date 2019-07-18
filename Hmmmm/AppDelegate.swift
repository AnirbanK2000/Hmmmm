//
//  AppDelegate.swift
//  Hmmmm
//
//  Created by Anirban Kumar on 6/5/19.
//  Copyright © 2019 Anirban Kumar. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
//        print("1111111")
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        print("2222222")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        print("3333333")
//
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if let user = user {
//                print("4444444")
//
//                let initialViewController = storyboard.instantiateViewController(withIdentifier: "LoggedIn")
//
//                self.window?.rootViewController = initialViewController
//                self.window?.makeKeyAndVisible()
//
//            } else {
//                print("55555555")
//                let initialViewController = storyboard.instantiateViewController(withIdentifier: "SignUpScreen")
//
//                self.window?.rootViewController = initialViewController
//                self.window?.makeKeyAndVisible()
//
//            }
//        }
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


}

