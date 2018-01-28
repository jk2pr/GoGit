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
import SDWebImage

class GitHubUserCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    let activityIndicator:UIActivityIndicatorView=UIActivityIndicatorView()
    private  var arrRes:[GitHubeUserData]=[]
    private var selectedRow:Int=0
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        return arrRes.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        tableView.backgroundColor=UIColor.clear
        return 125
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GitHubUserCell

        //let cell = tableView.cellForRow(at: indexPath) as! GitHubUserCell
        let data=arrRes[indexPath.row]
        cell.urlLabel.font=UIFont.boldSystemFont(ofSize: 20.0)
        cell.urlLabel.text=data.html_url
        cell.namelabel.text=data.login
        cell.imageview=cell.viewWithTag(1) as! UIImageView
        let url=URL(string:data.avatar_url!)
        cell.imageview.sd_setImage(with: url)
        
        let contentView = cell.contentView
        let margin=CGFloat(5)
        cell.contentView.layoutMargins.bottom=margin
       // cell.contentView.layoutMargins.top=margin
        //cell.contentView.layoutMargins.left=margin
        //cell.contentView.layoutMargins.right=margin
        
        cell.backgroundColor=UIColor.white
        //contentView.backgroundColor=UIColor.lightGray
        contentView.layer.cornerRadius=1
        contentView.layer.borderColor=UIColor.lightGray.cgColor
        contentView.layer.borderWidth=0.5
        contentView.layer.shadowRadius=1
        contentView.layer.shadowOpacity = 0.01
        contentView.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath

        
        
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup searchbar
        setUpSearchBar()
       
        self.tableView.isHidden=true
        activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.gray
        activityIndicator.hidesWhenStopped=true
        activityIndicator.center=self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
       // tableView.separatorStyle=UITableViewCellSeparatorStyle.singleLine
        //tableView.separatorColor=UIColor.darkGray
        Alamofire.request("https://api.github.com/search/users?q=Kotlin").responseJSON
            { (responseData) -> Void in
                guard responseData.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: responseData.result.error))")
                    return
                }

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
                if self.arrRes.count > 0 {
                    //  print(self.arrRes)
                    self.tableView.reloadData()
                    self.tableView.isHidden=false
                    self.activityIndicator.stopAnimating()
                }
            }
            // self.arrRes = items as! [String:AnyObject]
        }
        
    }
    func setUpSearchBar(){
        let searchBar:UISearchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBarStyle.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedRow=indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let web=segue.destination as! WebViewController
        web.githubUser=arrRes[selectedRow]
    }
}
// Do any additional setup after loading the view, typically from a nib.




