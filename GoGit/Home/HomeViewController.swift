//
//  HomeViewController.swift
//  GoGit
//
//  Created by Jitendra on 03/02/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Firebase
import SDWebImage

class GitHubRepoCell:UITableViewCell{
    
    @IBOutlet weak var payLoad: UILabel!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
}


class HomeViewController: UIViewController,
UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var repos=[Json4Swift_Base]()
    
    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.hidesBarsOnSwipe=true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        https://api.github.com/user
        
        let accessToken=UserDefaults.standard.value(forKey: "access_token") as! String
        
        let headers=["Authorization": accessToken,
                     "Accept": "application/json"]
          let user=Auth.auth().currentUser
        for u in (user?.providerData)!{
            print("user Id "+u.uid)
            print("Provider id "+u.providerID)
            print("Description "+u.description)
            
            print("Next......")
        
        }
        
        
        let feedUrl="https://api.github.com/users/jk2pr/received_events"
        
        var request = URLRequest(url: URL(string: feedUrl)!)
        // Set headers
        request.allHTTPHeaderFields=headers
    
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            do{
     let someDictionaryFromJSON = try JSONSerialization.jsonObject(with: data!, options: []) as! NSArray
                for dic in someDictionaryFromJSON {
                let repo = Json4Swift_Base(dictionary: (dic as! NSDictionary))
                    self.repos.append(repo!)
                     print(dic)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                }
            }catch let error as NSError{
                print(error.localizedDescription)
                
            }
            
        }
        task.resume()
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GitHubRepoCell
        let data=repos[indexPath.row]
        let fullText=(data.actor?.display_login)!+" "+getEventNameByType(
            eventName: data.type!)//+" "+data.repo?.name
        cell.actorName.text=fullText+" "+(data.repo?.name)!
        let url=URL(string:(data.actor?.avatar_url!)!)
        cell.actorImage.sd_setImage(with: url)
       // cell.eventName.text=getEventNameByType(eventName: data.type!)
        //cell.repoName.text=data.repo?.name
        
        let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))

        
        
        return cell
        
        
    }
    
    func getEventNameByType(eventName:String) -> String{
        if eventName.elementsEqual("CreateEvent")
        { return "created a Repository"}
        else if eventName.elementsEqual("ForkEvent")
        { return "forked a Repository"}
        else if eventName.elementsEqual("WatchEvent")
        { return "started following"}
        else {
            return "unKnow"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }

}
