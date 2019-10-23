//
//  AppDelegate.swift
//  TimeDebris
//
//  Created by gozap on 2017/12/29.
//  Copyright © 2017年 com.longdai. All rights reserved.
//

import UIKit
import CoreData
import SnapKit
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        self.window = UIWindow()
        self.window?.frame = UIScreen.main.bounds
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = UINavigationController.init(rootViewController: RootViewController())
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

