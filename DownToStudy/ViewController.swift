//
//  ViewController.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController, LoginViewControllerDelegate {
    
    var viewControllers = [UIViewController]()
    var loginViewController: LoginViewController?
    @IBOutlet var scrollView: UIScrollView!
    var didLayoutInitialViewControllers = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load view controllers
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("eventListViewController") as? EventListViewController {
            viewControllers.append(vc)
        }
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("radarViewController") as? RadarViewController {
            viewControllers.append(vc)
        }
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("profileViewController") as? ProfileViewController {
            viewControllers.append(vc)
        }
        
        // Check for authentication, show login if not authenticated
        if let lg = storyboard?.instantiateViewControllerWithIdentifier("loginViewController") as? LoginViewController {
            loginViewController = lg
            lg.delegate = self
            lg.view.frame = view.frame
            addChildViewController(lg)
            view.addSubview((lg.view)!)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !didLayoutInitialViewControllers {
            didLayoutInitialViewControllers = true
            view.sendSubviewToBack(scrollView)
            
            // Layout all view controller's views
            var xOffset = CGFloat(0.0);
            for vc in viewControllers {
                addChildViewController(vc)
                var frame = view.bounds
                frame.origin.x = xOffset
                vc.view.frame = frame
                scrollView.addSubview(vc.view)
                xOffset += frame.size.width
            }
            
            // Resize scroll view to fit everything
            let size = CGSize.init(width: xOffset, height: view.bounds.size.height)
            scrollView.contentSize = size
            
            // Scroll to 2nd page (at index 1)
            scrollTo(1, animated: false)
        }
    }
    
    func scrollTo(page: Int, animated: Bool) {
        let xOffset = scrollView.bounds.size.width * CGFloat(page)
        scrollView.setContentOffset(CGPoint.init(x: xOffset, y: 0.0), animated: animated)
    }
    
    // Login view controller delegate
    
    func loginDidAuthenticate(login: LoginViewController) -> Void {
        // Remove the login controller 
    }
}


extension ViewController : Routes {
    func processLogin(token: String, uid: String) {
        loginViewController?.processLogin(token, uid: uid)
    }
}

