//
//  ViewController.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import Moya



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let loginViewController = storyboard?.instantiateViewControllerWithIdentifier("loginViewController")
        loginViewController?.view.frame = view.frame
        addChildViewController(loginViewController!)
        view.addSubview((loginViewController?.view)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}

