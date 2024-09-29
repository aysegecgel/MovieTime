//
//  AppDelegate.swift
//  MovieTime
//
//  Created by Ayse Gecgel on 28.08.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navC = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navC
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

    
}

