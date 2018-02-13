//
//  ProfileViewController.swift
//  GoGit
//
//  Created by Jitendra on 31/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
  

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
            
        }   }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            tableView.backgroundColor=UIColor.clear
            return 125
        }
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //as! GitHubUserCell
//
//            //let cell = tableView.cellForRow(at: indexPath) as! GitHubUserCell
//            let data=arrRes[indexPath.row]
//            cell.urlLabel.font=UIFont.boldSystemFont(ofSize: 20.0)
//            cell.urlLabel.text=data.html_url
//            cell.namelabel.text=data.login
//            cell.imageview=cell.viewWithTag(1) as! UIImageView
//            let url=URL(string:data.avatar_url!)
//            cell.imageview.sd_setImage(with: url)
//
//            let contentView = cell.contentView
//            let margin=CGFloat(5)
//            contentView.layoutMargins.bottom=margin
//            cell.backgroundColor=UIColor.white
//            //contentView.backgroundColor=UIColor.lightGray
//            contentView.layer.cornerRadius=1
//            contentView.layer.borderColor=UIColor.lightGray.cgColor
//            contentView.layer.borderWidth=0.5
//            contentView.layer.shadowRadius=1
//            contentView.layer.shadowOpacity = 0.01
//            contentView.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
//
            
            
            return cell
        }
    
    
}
