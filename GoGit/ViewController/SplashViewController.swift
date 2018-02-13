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


protocol LoginSuccessCallBack {
    func loginSuccess()
}

class SplashViewController: UIViewController,LoginSuccessCallBack{
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var skip: UIButton!
    @IBOutlet weak var loginWithGitHub: UIButton!
    var user:User!
    
    override func viewDidLoad() {
    
    }
    override func viewWillAppear(_ animated: Bool) {
    
        user=Auth.auth().currentUser
        if(user==nil){
            skip.isHidden=false
            loginWithGitHub.isHidden=false
            animate()
        }
        else
        {
            redirectToHome()
        }
    }
    func loginSuccess() {
        redirectToHome()
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
    private func redirectToHome()
    {
        let when = DispatchTime.now() + 1 // change 1 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            // Your code with delay
            self.performSegue(withIdentifier: "redirectToHome", sender: self)
        }
    }
       
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "redirectToLogin"{
        let toViewController = segue.destination as! LoginAlertViewController
            toViewController.loginCallBack = self
            
        }
    }
@IBAction func onSkip(_ sender: UIButton) {
    if(!self.logo.isAnimating)
    {//self.performSegue(withIdentifier: "navigateToHome", sender: self)
    }
    
}
@IBAction func onLoginButtonClick(_ sender: UIButton) {
    if(!self.logo.isAnimating){
         self.performSegue(withIdentifier: "redirectToLogin", sender: self)
    /*    let alertViewController = self.storyboard?.instantiateViewController(withIdentifier: "loginalertviewcontroller") as!  LoginAlertViewController
        self.present(alertViewController, animated: true, completion: nil)*/
    }
}
}

