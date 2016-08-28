//
//  LoginViewController.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var topLabel: UILabel!
    
    weak var delegate: Routes?
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func tappedLoginButton(sender: UIButton) {
        
        // We need to go ahead and launch study room if it exists else go ahead and launch the app store
        launchStudyRoom()
    }
    
    func launchStudyRoom() {
        UIApplication.sharedApplication().openURL(NSURL (string: "srauth://authorize?client_id=4")!)
    }

}

extension LoginViewController : Routes {
    func processLogin(token: String, uid: String) {
        UserDefaultsManager.setString("token", value: token)
        UserDefaultsManager.setString("uid", value: uid)
    }
}