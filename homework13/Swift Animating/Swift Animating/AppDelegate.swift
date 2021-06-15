//
//  AppDelegate.swift
//  Swift Animating
//
//  Created by 18267440 on 15.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController =  ViewController()
        window?.makeKeyAndVisible()
        return true
    }


}

