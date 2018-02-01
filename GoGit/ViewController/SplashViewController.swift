//
//  SplashViewController.swift
//  GoGit
//
//  Created by Jitendra on 21/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//


import UIKit
import WebKit
import Firebase



class SplashViewController: UIViewController{
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var loginWithGitHub: UIButton!
    var user:User!
    
    override func viewDidLoad() {
         user=Auth.auth().currentUser
    }
    override func viewWillAppear(_ animated: Bool) {
    
       
        if(user==nil){
            skip.isHidden=false
            loginWithGitHub.isHidden=false
            animate()
        }
        else
        {
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
            print(uid)
            print(email)
            print(photoURL)
            redirectToProfile()
            print("Navigated to User Profile")
        }
    }
    private func animate(){
        self.logo.transform = CGAffineTransform(translationX: 0, y: logo.frame.origin.y+200)
            .concatenating(CGAffineTransform(scaleX: 0.5, y: 0.5))
        
        UIView.animate(withDuration: 5.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: [.curveEaseOut], animations: {
            self.logo.transform = .identity
            self.logo.alpha = 1
            
        }, completion:{
            (value: Bool) in
            
        })
        
    }
    private func redirectToProfile()
    {
        DispatchQueue.main.async() {
            [unowned self] in
          //  self.performSegue(withIdentifier: "navigatetouserprofile", sender: self)
            self.performSegue(withIdentifier: "navigateToUserProfile", sender: self)
        }
        
      //  self.performSegue(withIdentifier: "navigatetouserprofile", sender: self)
        }

@IBAction func onSkip(_ sender: UIButton) {
    if(!self.logo.isAnimating)
    {//self.performSegue(withIdentifier: "navigateToHome", sender: self)
    }
    
}
@IBAction func onLoginButtonClick(_ sender: UIButton) {
    if(!self.logo.isAnimating){
        let alertViewController = self.storyboard?.instantiateViewController(withIdentifier: "webalertviewcontroller") as!  LoginAlertViewController
        self.present(alertViewController, animated: true, completion: nil)
    }
}
}

