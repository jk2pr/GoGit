//
//  Colors.swift
//  GoGit
//
//  Created by Jitendra on 31/01/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import Foundation
import UIKit
class Colors{
static func uicolorFromHex(rgbValue:UInt32)->UIColor{
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    
    return UIColor(red:red, green:green, blue:blue, alpha:1.0)
}
}
