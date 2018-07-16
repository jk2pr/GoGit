//
//  ProfileViewController.swift
//  GoGit
//
//  Created by Jitendra on 31/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import UIKit
import Firebase
import RxAlamofire

class ProfileViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var repoCount: UILabel!
    @IBOutlet weak var starCount: UILabel!
    @IBOutlet weak var followrsCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    

    var user:Login!
    var repos:[Repository] = []
    

    @IBOutlet weak var navigation: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
         user=Constants.getLoginData()
        navigationController?.hidesBarsOnSwipe=true
        if(!(user==nil)){
            let url=URL(string:user.avatar_url!)
           profileImageView.sd_setImage(with: url)
            displayName.text=user.name?.uppercased()
            email.text=user.email
            
            repoCount.text="Reps \(user.public_repos!+user.total_private_repos!+user.owned_private_repos!)"
            
            starCount.text="Stars \(0)"
            followrsCount.text="Followers \(user.followers!)"
            followingCount.text="Following \(user.following!)"
            //UserDefaults.standard.value(forKey: "access_token")
            
        getUserRepository()
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      //
        let v=UIView()
        v.backgroundColor=UIColor.cyan
        let image=UIImageView(frame:CGRect(x:0,y:5,width:tableView.frame.width,height:60))
        image.backgroundColor=UIColor.yellow
        let segmentedControl=UISegmentedControl(frame:CGRect(x:0,y:image.frame.height+5,width:tableView.frame.width,height:60))
        segmentedControl.backgroundColor=UIColor.clear
       
        segmentedControl.insertSegment(withTitle: "Repository", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Followers", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "Followings", at: 2, animated: true)
        segmentedControl.insertSegment(withTitle: "Stars", at: 2, animated: true)
        segmentedControl.setTitle("Test", forSegmentAt: 0)
        v.addSubview(image)
        v.addSubview(segmentedControl)
        return v
    }
    func getUserRepository(){
        let accessToken=UserDefaults.standard.value(forKey: "access_token") as! String
        let headers=["Authorization":"token "+accessToken,
                     "Accept": "application/json"]
        _=RxAlamofire.requestJSON(.get, Constants.getLoginData().repos_url!,headers:headers)
            .subscribe(onNext:{(r, json) in
                 print("Repos Data \(json)")
                let d=json as! NSArray
                for dic  in d{
                    let ddd = dic as! NSDictionary
                    let repo = Repository(dictionary:ddd)
                    self.repos.append(repo!)
                }
            }
                ,
                       onError: {  (error) in
                        print(error.localizedDescription)
            },
                       onCompleted:{
                        print("onCompleted")
            })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let nibName = UINib(nibName: "TableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "cell")
        return 50
    }
    
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
        {
            tableView.backgroundColor=UIColor.clear
            //tableView.isScrollEnabled=false;
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
