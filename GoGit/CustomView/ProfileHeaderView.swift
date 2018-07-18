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
        let nib=loadNib(nibName: "ProfileHeaderView")
        self.addSubview(nib)
    }
}
