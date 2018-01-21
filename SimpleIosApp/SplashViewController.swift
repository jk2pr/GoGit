//
//  SplashViewController.swift
//  SimpleIosApp
//
//  Created by Jitendra on 21/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//


import UIKit
import WebKit

class SplashViewController: UIViewController{
    @IBOutlet weak var logo: UIImageView!
    
   
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var loginWithGitHub: UIButton!

    
    
    @IBAction func onSkip(_ sender: UIButton) {
        if(!self.logo.isAnimating)
        {self.performSegue(withIdentifier: "navigateToHome", sender: self)
        }
        
    }
    @IBAction func onLoginButtonClick(_ sender: UIButton) {
    }
    override func viewDidAppear(_ animated: Bool) {
        
        self.logo.transform = CGAffineTransform(translationX: 0, y: logo.frame.origin.y+200)
            .concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
        
        
        UIView.animate(withDuration: 5.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [.curveEaseOut], animations: {
            self.logo.transform = .identity
            self.logo.alpha = 1
            
        }, completion:{
             (value: Bool) in
//             let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//
            
        
            
        })
        
    }
}
