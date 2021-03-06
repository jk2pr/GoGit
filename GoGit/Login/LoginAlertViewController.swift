//
//  WebAlertViewController.swift
//  GoGit
//
//  Created by Jitendra on 23/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import Firebase
import RxAlamofire
import Alamofire
import SwiftyJSON

class LoginAlertViewController: ViewController, WKNavigationDelegate{

    var auth: Auth!
    var loginCallBack:LoginSuccessCallBack!
    
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(white: 0.5, alpha: 0.4)
        webview.navigationDelegate = self
        auth = Auth.auth()
        
        
        
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
       // print(webView.url ?? "google.co.in")
        if(webView.url?.absoluteString.starts(with:Constants.REDIRECT_URL_CALLBACK))!{
            let code = getQueryStringParameter(url: (webView.url?.absoluteString)!, param: "code")
            print("Code  " + code!)
            getAccessToken(code: code!)
            
        }
    }
    func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    func getAccessToken(code: String){
       
       
        let params = ["client_id": Constants.clientId,
                      "client_secret": Constants.secretId,
                      "redirect_uri": Constants.REDIRECT_URL_CALLBACK,
                      "state": "123",
                      "code": code]
        let headers=["Accept": "application/json"]
      
        
        Alamofire.request(Constants.accessTokenUrl,
                          method: .post,
                          parameters: params,
                          encoding: JSONEncoding.default,
                          headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON
            { (responseData) -> Void in
              
                guard responseData.result.isSuccess else {
                    print("Error while fetching remote rooms: \(String(describing: responseData.result.error))")
                    return
                }
                if((responseData.result.value) != nil) {
                     let swiftyJsonVar = JSON(responseData.result.value!)
                    print(swiftyJsonVar)
                    let  accessToken = swiftyJsonVar["access_token"].string!
                    UserDefaults.standard.setValue(accessToken, forKey: "access_token")
                    let credential = GitHubAuthProvider.credential(withToken: accessToken)
                    self.signInWithFireBase(credential: credential)
                   //
                   
                }
        }
      
        
        
    }
   
    func signInWithFireBase(credential:AuthCredential){
        auth.signIn(with: credential) {
            (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else{
                print("User Signed In sucessfully")
                 self.getUserProfile()
                
           }
         }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        let u = Constants.githubLoginUrl + "?scope=user repo_deployment repo &client_id=" as String
        let v = Constants.clientId + "&secretId=" as String
        let completeUrl = u +
            v+Constants.secretId + "&state=" + "123"
        
        
       let urlReq = URLRequest(url: URL(string: completeUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!)
      //  print(urlReq.url as Any)
        webview.load(urlReq)
       
        
    }
    func getUserProfile(){
        let accessToken=UserDefaults.standard.value(forKey: "access_token") as! String
        let headers=["Authorization":"token "+accessToken,
                     "Accept": "application/json"]
        RxAlamofire.requestJSON(.get, Constants.urlProfile,headers:headers)
            .debug()
            .subscribe(onNext:{[weak self](r, json) in
                let d=json as! NSDictionary
                let defaults = UserDefaults.standard
                let data=Login(dictionary:d)
                print(data!)
               // let encodedData = NSKeyedArchiver.archivedData(withRootObject: data as Any)
                defaults.set(data?.dictionaryRepresentation(),forKey: "user")
                let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
                DispatchQueue.main.asyncAfter(deadline: when) {
                self!.dismiss(animated: true, completion: nil)
                self!.loginCallBack.loginSuccess()
                
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
    func parseJson(data:Any){
        
           // let swiftyJsonVar = try JSON(data) as! NSDictionary
            //print(swiftyJsonVar)
        
        
        
    }
}
