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
    
    weak var delegate: LoginViewControllerDelegate?
    
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

protocol LoginViewControllerDelegate : NSObjectProtocol {
    
    func loginDidAuthenticate(login: LoginViewController) -> Void
    
}

extension LoginViewController : Routes {
    func processLogin(token: String, uid: String) {
        
        // Go ahead and save the token and uid in user defaults
        UserDefaultsManager.setString("token", value: token)
        UserDefaultsManager.setString("uid", value: uid)

        StudyRoomProvider.request(.accountInfo()) { result in
            switch result {
            case let .Success(response):
                do {
                    if let json = try response.mapJSON() as? NSDictionary {
                        UserDefaultsManager.setObject("info", value: json)
                    } else {
                        print("Unable to convert")
                    }
                } catch {
                    print("Unable to convert")
                }
                break
            case let .Failure(error):
                print(error)
                break
            }
        }
        
        StudyRoomProvider.request(.getCourses()) { result in
            switch result {
            case let .Success(response):
                do {
                    if let json = try response.mapJSON() as? NSDictionary {
                        UserDefaultsManager.setObject("courses", value: json)
                    } else {
                        print("Unable to convert")
                    }
                } catch {
                    print("Unable to convert")
                }

                break
            case let .Failure(error):
                print(error)
                break
            }
        }
    }
}