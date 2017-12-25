//
//  WebViewController.swift
//  SimpleIosApp
//
//  Created by Jitendra on 25/12/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var githubUser:GitHubeUserData!

    @IBOutlet  weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlReq = URLRequest(url: URL(string: githubUser.html_url!)!)
        print(githubUser.html_url! )
        webView.load(urlReq)
        // Do any additional setup after loading the view.
    }


 

}
