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
    var user:User!
    @IBOutlet weak var navigation: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
         user=Auth.auth().currentUser
        navigationController?.hidesBarsOnSwipe=true
        if((user==nil)==false){
        profileImageView.sd_setImage(with: user.photoURL)
            displayName.text=user.displayName?.uppercased()
            email.text=user.email
        }
        
        // Do any additional setup after loading the view.
    }

   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
