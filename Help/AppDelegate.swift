//
//  AppDelegate.swift
//  Help
//
//  Created by rvs on 11/01/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let splashViewController = SplashViewController(nibName: "SplashViewController", bundle: .main)
        let navigationController = UINavigationController(rootViewController: splashViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
}

