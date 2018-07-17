//
//  ProfileHeaderView.swift
//  GoGit
//
//  Created by Jitendra on 17/07/18.
//  Copyright © 2018 Jitendra. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
    override  init(frame:CGRect){
        super.init(frame:frame)
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit()  {
        let contentView = Bundle.main?.loadNibNamed("ProfileHeaderView",owner:self,options:nil) as UIView
        self.addSubview(contentView!)
    }
}
