//
//  AppDelegate.swift
//  Draw
//
//  Created by 18267440 on 01.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainView = MainView.createMainView()
        let navigationController = UINavigationController(rootViewController: mainView)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

