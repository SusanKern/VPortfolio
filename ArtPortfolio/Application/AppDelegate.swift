//
//  AppDelegate.swift
//  ArtPortfolio
//
//  Created by Susan Kern on 1/7/18.
//  Copyright © 2018 SKern. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    
    // MARK: Public variables
    
    var window: UIWindow?

    
    // MARK: Private variables
    
    fileprivate var _dataController: DataController = {
        return DataController()
    }()
    
    
    // MARK: Application Lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        SAKLogging.initialize()
        
        // Increment launch count
        SAKDefaults.incrementLaunchCount()
        
        // Appearance
        self.customizeAppearance(application)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        log.info("WillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        log.info("DidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        log.info("WillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        log.info("DidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        log.info("WillTerminate")
    }
    
    
    // MARK: Appearance
    
    private func customizeAppearance(_ application: UIApplication) {
        // Global tint
        self.window?.tintColor = UIColor.app_globalTintColor()
        
        // Navigation bars
        UINavigationBar.appearance().barTintColor = UIColor.app_globalTintColor()
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,
                                                            NSAttributedStringKey.font : UIFont(name: "Noteworthy-Light", size: 20)!]
        UINavigationBar.appearance().shadowImage = UIImage.imageWithColor(color: .app_lightGrayColor())
        
        UIApplication.shared.isStatusBarHidden = true
        
        UIBarButtonItem.appearance().setTitleTextAttributes( [
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.font : UIFont(name: "Noteworthy-Bold", size: 20)!], for: UIControlState.normal)
    }
}


// MARK: Singletons

extension DataController {
    static var sharedInstance: DataController {
        return (UIApplication.shared.delegate as! AppDelegate)._dataController
    }
}

