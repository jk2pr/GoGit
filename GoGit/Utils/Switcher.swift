//
//  Switcher.swift
//  GoGit
//
//  Created by Jitendra on 11/02/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Switcher {
    
    static func updateRootVC(){
        
        let status = (Auth.auth().currentUser==nil)==false
        var rootVC : UIViewController?
        
        print(status)
        
        
        if(status == true){
//            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarvc") as! TabBarVC
        }else{
            rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = rootVC
        }
        
        
        
    }
    
}
