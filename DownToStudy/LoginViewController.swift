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
    @IBOutlet weak var loadingLabel: UILabel!
    
    weak var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingLabel.alpha = 0.0
    }
    
    @IBAction func tappedLoginButton(sender: UIButton) {
        
        // We need to go ahead and launch study room if it exists else go ahead and launch the app store
        launchStudyRoom()
    }
    
    func launchStudyRoom() {
        UIApplication.sharedApplication().openURL(NSURL (string: "srauth://authorize?client_id=4")!)
    }
    
    func setLoading(loading: Bool) {
        if loading {
            // Fade out UI
            UIView.animateWithDuration(0.3) {
                for sv in self.view.subviews {
                    if sv == self.loadingLabel {
                        sv.alpha = 1.0
                    } else {
                        sv.alpha = 0.0
                        sv.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.75, 0.75)
                    }
                }
            }
        } else {
            // Fade in UI
            UIView.animateWithDuration(0.3) {
                for sv in self.view.subviews {
                    if sv == self.loadingLabel {
                        sv.alpha = 0.0
                    } else {
                        sv.alpha = 1.0
                        sv.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
                    }
                }
            }
        }
    }
    
}

protocol LoginViewControllerDelegate : NSObjectProtocol {
    
    func loginWillStartFetchingRemoteData(login: LoginViewController) -> Void
    func loginDidAuthenticate(login: LoginViewController) -> Void
    
}

extension LoginViewController : Routes {
    func processLogin(token: String, uid: String) {
        
        // Start loading
        setLoading(true)
        
        // Tell our delegate we're going to start processing
        delegate?.loginWillStartFetchingRemoteData(self)
        
        // Go ahead and save the token and uid in user defaults
        UserDefaultsManager.setString("token", value: token)
        UserDefaultsManager.setString("uid", value: uid)

        var didGetAccountInfo = false
        var didGetCourses = false
        
        StudyRoomProvider.request(.accountInfo()) { result in
            switch result {
            case let .Success(response):
                do {
                    if let json = try response.mapJSON() as? NSDictionary {
                        UserDefaultsManager.setObject("info", value: json)
                        didGetAccountInfo = true
                        if didGetAccountInfo && didGetCourses {
                            self.delegate?.loginDidAuthenticate(self)
                        }
                    } else {
                        print("Unable to convert")
                        self.setLoading(false)
                    }
                } catch {
                    print("Unable to convert")
                    self.setLoading(false)
                }
                break
            case let .Failure(error):
                print(error)
                self.setLoading(false)
                break
            }
        }
        
        StudyRoomProvider.request(.getCourses()) { result in
            switch result {
            case let .Success(response):
                do {
                    if let json = try response.mapJSON() as? NSDictionary {
                        UserDefaultsManager.setObject("courses", value: json)
                        didGetCourses = true
                        if didGetAccountInfo && didGetCourses {
                            self.delegate?.loginDidAuthenticate(self)
                        }
                    } else {
                        print("Unable to convert")
                        self.setLoading(false)
                    }
                } catch {
                    print("Unable to convert")
                    self.setLoading(false)
                }

                break
            case let .Failure(error):
                print(error)
                self.setLoading(false)
                break
            }
        }
    }
}