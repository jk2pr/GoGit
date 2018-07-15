//
//  Constants.swift
//  GoGit
//
//  Created by Jitendra on 27/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import Foundation
struct  Constants {
static let clientId="5db96facac0277a35f64",
    secretId="b62824aa8700b99feb0e576d97130d801b47fe1c",
    githubLoginUrl="https://github.com/login/oauth/authorize",
    REDIRECT_URL_CALLBACK = "https://gogit-5a346.firebaseapp.com/__/auth/handler",
    accessTokenUrl = "https://github.com/login/oauth/access_token",
    urlProfile="https://api.github.com/user",
    feedUrl="https://api.github.com/users/LOGIN_USER/received_events"
    static var user:Login!
    static func getLoginData() -> Login
    {
        if(Constants.user==nil){
            Constants.user=Login(dictionary: UserDefaults.standard.object(forKey: "user") as! NSDictionary)
        }
        return Constants.user
        
    }
    }
