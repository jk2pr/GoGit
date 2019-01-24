//
//  AppDelegate.swift
//  GoGit
//
//  Created by Jitendra on 16/12/2017.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit
import Firebase



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

//Today is 24 January
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let userDefaults = UserDefaults.standard
        if userDefaults.bool(forKey: "hasRunBefore") == false {
           
          logout()
          
        }
       // self.navigationController.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font:
        let attributes = [NSAttributedStringKey.font: UIFont(name: "AvenirNextCondensed-DemiBold",
                                                             size: 18)!,
                          NSAttributedStringKey.foregroundColor: UIColor.white,
                          NSAttributedStringKey.backgroundColor: UIColor.clear]
        
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        
        let navBarColor = Colors.uicolorFromHex(rgbValue:0x0088a3)
        UINavigationBar.appearance().barTintColor = navBarColor
        UINavigationBar.appearance().tintColor = UIColor.white
        
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = navBarColor
        }
        
       //
        

        // Override point for customization after application launch.
        return true
    }

    func logout(){
        // remove keychain items here
        // update the flag indicator
      
        do {
            try   Auth.auth().signOut()
            let userDefaults=UserDefaults.standard
            userDefaults.set(true, forKey: "hasRunBefore")
            userDefaults.synchronize() // forces the app to update the NSUserDefaults
        }catch {
            
        }
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

