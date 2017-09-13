//
//  AppDelegate.swift
//  MyCar
//
//  Created by Douglas Taquary on 30/08/17.
//  Copyright © 2017 Douglas Taquary. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    fileprivate(set) var provider = Networking.newDefaultNetworking()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        Apperance.customizeNavigationBar()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        let navController = UINavigationController(rootViewController: BrandViewController(provider: self.provider))
        self.window?.rootViewController = navController
        
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

