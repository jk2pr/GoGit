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

class WebAlertViewController: ViewController, WKNavigationDelegate{
    
    @IBOutlet weak var webview: WKWebView!
     let clientId="N/A"
     let secretId="N/A"
     let githubLoginUrl="https://www.github.com/login/oauth/authorize"
    
    
    private let REDIRECT_URL_CALLBACK = "https://daggerrxkotlin.firebaseapp.com/__/auth/handler"
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(white: 0.5, alpha: 0.4)
        webview.navigationDelegate = self
       
        
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
       // print(webView.url ?? "google.co.in")
        if(webView.url?.absoluteString.starts(with:REDIRECT_URL_CALLBACK))!{
            self.dismiss(animated: true, completion: nil)
        }
        print(webView.url?.absoluteString as Any)
        print(REDIRECT_URL_CALLBACK)

    }
 
    override func viewDidAppear(_ animated: Bool) {
        
        let u = self.githubLoginUrl + "?scope=user:email user:follow public_repo &client_id=" as String
        let v = clientId + "&secretId=" as String
        let completeUrl = u +
            v+secretId + "&state=" + "123"
        
        
        print(completeUrl)
        //completeUrl.stringByAddingPercentEncodingWithAllowedCharacters()
        //let csCopy = CharacterSet(bitmapRepresentation:
          //  CharacterSet.urlPathAllowed.bitmapRepresentation)
        let urlReq = URLRequest(url: URL(string: completeUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!)
        print(urlReq.url as Any)
        webview.load(urlReq)
       
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
}
