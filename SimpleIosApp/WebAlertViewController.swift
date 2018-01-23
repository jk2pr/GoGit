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

class WebAlertViewController: ViewController,WKUIDelegate{
    
    @IBOutlet weak var webview: WKWebView!
    private let REDIRECT_URL_CALLBACK = "https://daggerrxkotlin.firebaseapp.com/__/auth/handler"
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(white: 0.5, alpha: 0.4)
        webview.uiDelegate=self
       
        
    }
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if request.url?.absoluteString == "https://www.google.com" {
            return false
        }
        return true
    }
    override func viewDidAppear(_ animated: Bool) {
        let urlReq = URLRequest(url: URL(string: "http://www.google.co.in")!)
        webview.load(urlReq)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
}
