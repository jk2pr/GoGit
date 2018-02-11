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
    
    @IBOutlet weak var actorName: UILabel!
    @IBOutlet weak var actorImage: UIImageView!
}


class HomeViewController: UIViewController,
UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var repos=[Json4Swift_Base]()
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = false
    }
   
    
    private func redirectToUseProfile()
    {
    
        self.navigationController?.performSegue(withIdentifier: "navigateToProfile", sender: self)
    
        
    }
    @IBAction func onMore(_ sender: UIBarButtonItem) {
        
        print("More click")
        
        let alertController = UIAlertController(title: "Signed in as jk2pr", message: nil, preferredStyle: .actionSheet)
        
        let actionHandler = { (action:UIAlertAction!) -> Void in
            switch action.title {
            case "Your Profile"?:
                self.redirectToUseProfile()
            default: break
                
            }
        }
        
        for i in ["Your Profile","Your Stars", "Logout", "Setting"] {
            alertController.addAction(UIAlertAction(title: i, style: .destructive, handler:actionHandler))
        }
        
        self.present(alertController, animated: true, completion: nil)

    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        https://api.github.com/user
        
        let accessToken=UserDefaults.standard.value(forKey: "access_token") as! String
        
        let headers=["Authorization":accessToken,
                     "Accept": "application/json"]
    
        let feedUrl="https://api.github.com/users/jk2pr/received_events"
        //?page=1&per_page=100"
        
        var components = URLComponents(string: feedUrl)!
        components.queryItems = [URLQueryItem(name: "page", value: "1"),
                                 URLQueryItem(name: "per_page", value: "100")]
        
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        var request = URLRequest(url: components.url!)
        // Set headers
        request.allHTTPHeaderFields=headers
        request.httpMethod="GET"
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
        let eventName=getEventNameByType(eventName: data.type!)
        let actorName=data.actor?.display_login!
        let repoName=data.repo?.name!

        cell.actorName.text=actorName!+" "+eventName+" "+repoName!
        let url=URL(string:(data.actor?.avatar_url!)!)
        cell.actorImage.sd_setImage(with: url)
          
        let attributedString = NSMutableAttributedString(string: cell.actorName.text!)
        attributedString.addAttribute(.link, value: data.actor?.url! as Any, range: NSRange(location: 0, length: (data.actor?.display_login?.count)!))
        cell.actorName.attributedText=attributedString

        decorateCell(cell: cell)
        
        return cell
        
        
    }
    func decorateCell(cell: GitHubRepoCell){
        let contentView = cell.contentView
        let margin=CGFloat(5)
        cell.contentView.layoutMargins.bottom=margin
       cell.backgroundColor=UIColor.white
        contentView.layer.cornerRadius=1
        contentView.layer.borderColor=UIColor.lightGray.cgColor
        contentView.layer.borderWidth=0.5
        contentView.layer.shadowRadius=1
        contentView.layer.shadowOpacity = 0.01
        contentView.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
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
