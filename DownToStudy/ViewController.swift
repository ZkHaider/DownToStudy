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

