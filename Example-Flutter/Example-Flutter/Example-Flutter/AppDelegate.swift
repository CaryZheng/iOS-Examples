//
//  AppDelegate.swift
//  Example-Flutter
//
//  Created by Cary on 2019/12/12.
//  Copyright © 2019 Cary. All rights reserved.
//

import UIKit
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let firstVC = ViewController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: firstVC)
        
        self.window?.makeKeyAndVisible()
        
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: self.flutterEngine);
        
        return true
    }

}

