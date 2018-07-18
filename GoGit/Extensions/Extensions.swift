//
//  Extensions.swift
//  GoGit
//
//  Created by Jitendra on 18/07/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    func loadNib(nibName:String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
