//
//  ViewController.swift
//  SimpleIosApp
//
//  Created by Jitendra on 16/12/2017.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON
import SwiftyJSON

class GitHubUserCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
  private  var arrRes:[GitHubeUserData]=[]
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return arrRes.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GitHubUserCell
        let data=arrRes[indexPath.row]
        cell.urlLabel.text=data.login
      
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.github.com/search/users?q=Kotlin").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                let items = swiftyJsonVar["items"].arrayValue
                    for  item  in items
                    {
                        let uid = item["uid"].int
                        let login = item["login"].string
                        let avatar_url = item["avatar_url"].string
                        let id = item["id"].int
                        let url = item["url"].string
                        let html_url = item["html_url"].string
                        let followers_url = item["followers_url"].string
                        let following_url = item["following_url"].string
                        let starred_url = item["starred_url"].string
                        let gists_url = item["gist_url"].string
                        let type = item["type"].string
                        let score = item["score"].double
                       
                        
                        let gitHubUser=GitHubeUserData(uid: uid,login: login,avatar_url: avatar_url,id: id,url: url,html_url: html_url,followers_url: followers_url,following_url: following_url,starred_url: starred_url,gists_url: gists_url,type: type,score: score!)

                        self.arrRes.append(gitHubUser)
                    }
                    
                }
                   // self.arrRes = items as! [String:AnyObject]
                }
                if self.arrRes.count > 0 {
                  //  print(self.arrRes)
                  self.tableView.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.

  


