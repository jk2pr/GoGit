//
//  WebAlertViewController.swift
//  SimpleIosApp
//
//  Created by Jitendra on 23/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import Foundation
import UIKit
import WebKit
import FirebaseAuth
import Alamofire
import SwiftyJSON

class WebAlertViewController: ViewController, WKNavigationDelegate{
    
    @IBOutlet weak var webview: WKWebView!
     let clientId=""
     let secretId=""
     let githubLoginUrl="https://github.com/login/oauth/authorize"
    
    
    private let REDIRECT_URL_CALLBACK = "https://gogit-5a346.firebaseapp.com/__/auth/handler"
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(white: 0.5, alpha: 0.4)
        webview.navigationDelegate = self
       
        
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
       // print(webView.url ?? "google.co.in")
        if(webView.url?.absoluteString.starts(with:REDIRECT_URL_CALLBACK))!{
            let code = getQueryStringParameter(url: (webView.url?.absoluteString)!, param: "code")
            print("Coode  " + code!)
            getAccessToken(code: code!)
            
        }
    }
    func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == param })?.value
    }
    
    func getAccessToken(code: String){
       let accessTokenUrl = "https://github.com/login/oauth/access_token"
       
        let params = ["client_id": clientId,
                      "client_secret": secretId,
                      "redirect_uri": REDIRECT_URL_CALLBACK,
                      "state": "123",
                      "code": code]
        let headers=["Accept": "application/json"]
      
        
        Alamofire.request(accessTokenUrl,
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
                    let credential = GitHubAuthProvider.credential(withToken: accessToken)
                    self.signInWithFireBase(credential: credential)
                   
                }
        }
      
        
    }
    func signInWithFireBase(credential:AuthCredential){
        Auth.auth().signIn(with: credential) {
            (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else{
                print("User Signed In sucessfully")
                
            }
            self.dismiss(animated: true, completion: nil)
            // User is signed in
            // ...
        }
    }
      
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let u = self.githubLoginUrl + "?scope=user:email user:follow public_repo &client_id=" as String
        let v = clientId + "&secretId=" as String
        let completeUrl = u +
            v+secretId + "&state=" + "123"
        
        
       // print(completeUrl)
        //completeUrl.stringByAddingPercentEncodingWithAllowedCharacters()
        //let csCopy = CharacterSet(bitmapRepresentation:
          //  CharacterSet.urlPathAllowed.bitmapRepresentation)
        let urlReq = URLRequest(url: URL(string: completeUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!)
      //  print(urlReq.url as Any)
        webview.load(urlReq)
       
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
}
