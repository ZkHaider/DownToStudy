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
    
    @IBOutlet var radar: Radar!
    var loginViewController: LoginViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let lg = storyboard?.instantiateViewControllerWithIdentifier("loginViewController") as? LoginViewController {
            loginViewController = lg
            lg.delegate = self
            lg.view.frame = view.frame
            addChildViewController(lg)
            view.addSubview((lg.view)!)
        }
        
        // Hardcoded array of people if we're not authenticated
        var images = [String]()
        images.append("https://www.getstudyroom.com/api/accounts/avatar/431794?s=200")
        images.append("https://www.getstudyroom.com/api/accounts/avatar/632705?s=200")
        images.append("https://www.getstudyroom.com/api/accounts/avatar/715677?s=200")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/822782/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/244270/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/738450/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/917808/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/264314/None/original.jpeg")
        radar.update(images)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        restartRotatingIfNeeded()
    }

    func restartRotatingIfNeeded() -> Void {
        if !radar.isRotating() {
            rotateRadar()
        }
    }
    
    func rotateRadar() -> Void {
        radar.startRotation()
    }
    
}

extension ViewController : Routes {
    func processLogin(token: String, uid: String) {
        loginViewController?.processLogin(token, uid: uid)
    }
}

