//
//  AppDelegate.swift
//  VIPER-Exemple
//
//  Created by João Santos on 03/08/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ConfigurationRemote().fetchConfiguration()
        
        let view = MoviesRouter.createModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        return true
    }

}
