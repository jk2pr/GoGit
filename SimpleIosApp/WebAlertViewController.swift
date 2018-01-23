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

class WebAlertViewController: ViewController{
    
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(white: 0.5, alpha: 0.4)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let urlReq = URLRequest(url: URL(string: "http://www.google.co.in")!)
        webview.load(urlReq)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
}
