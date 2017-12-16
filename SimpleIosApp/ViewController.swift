//
//  ViewController.swift
//  SimpleIosApp
//
//  Created by Jitendra on 16/12/2017.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lable: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func onClick(_ sender: UIButton) {
        lable.text="updated by button"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
}

