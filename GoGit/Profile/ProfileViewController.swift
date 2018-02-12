//
//  ProfileViewController.swift
//  GoGit
//
//  Created by Jitendra on 31/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var repoCount: UILabel!
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var followrsCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    
    
    var user:Login!
    @IBOutlet weak var navigation: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
         user=Constants.getLoginData()
        navigationController?.hidesBarsOnSwipe=true
        if((user==nil)==false){
            let url=URL(string:user.avatar_url!)
           profileImageView.sd_setImage(with: url)
            displayName.text=user.name?.uppercased()
            email.text=user.email
            
            repoCount.text="Reps \(user.public_repos!+user.total_private_repos!+user.owned_private_repos!)"
            
            starCount.text="Stars \(0)"
            followrsCount.text="Followers \(user.followers!)"
            followingCount.text="Following \(user.following!)"
            //UserDefaults.standard.value(forKey: "access_token")
            
        }
        
        // Do any additional setup after loading the view.
        
//        let params = ["client_id": Constants.clientId,
//                      "client_secret": Constants.secretId,
//                      "redirect_uri": Constants.REDIRECT_URL_CALLBACK,
//                   ]
        
    }
    
}
