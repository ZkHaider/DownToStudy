//
//  ViewController.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import Moya

protocol PageController : NSObjectProtocol {
    func reload(animated: Bool) -> Void
}

extension UIViewController: PageController {
    func reload(animated: Bool) -> Void {
        
    }
}

class ViewController : UIViewController, LoginViewControllerDelegate, UITabBarDelegate {
    
    let debugging = false
    
    var viewControllers = [UIViewController]()
    var loginViewController: LoginViewController?
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet var bottomTabBarConstraint: NSLayoutConstraint!
    var didLayoutInitialViewControllers = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.clearColor()
        tabBar.backgroundImage = UIImage.init()
        tabBar.shadowImage = UIImage.init()
        
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
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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
            
            // Check for authentication
            let isAuthenticated = director.isUserAuthenticated()
            if (!isAuthenticated) {
                
                // Show login if not authenticated
                if let lg = storyboard?.instantiateViewControllerWithIdentifier("loginViewController") as? LoginViewController {
                    loginViewController = lg
                    lg.delegate = self
                    lg.view.frame = view.frame
                    addChildViewController(lg)
                    view.addSubview((lg.view)!)
                }
                
                // Hide the tab bar
                bottomTabBarConstraint.constant = -(tabBar.bounds.size.height + 10.0) // 10px more cuz the radar icon goes out of bounds
                view.layoutIfNeeded()
                
            }
        }
    }
    
    func scrollTo(page: Int, animated: Bool) {
        let xOffset = scrollView.bounds.size.width * CGFloat(page)
        scrollView.setContentOffset(CGPoint.init(x: xOffset, y: 0.0), animated: animated)
    }
    
    // Login view controller delegate methods
    
    func loginWillStartFetchingRemoteData(login: LoginViewController) -> Void {
        // Show loading by making the radar go bananas
        if let radarVC = viewControllers[1] as? RadarViewController {
            radarVC.startLoadingAnimation()
        }
    }
    
    func loginDidAuthenticate(login: LoginViewController) -> Void {
        
        // Remove the login controller
        login.willMoveToParentViewController(nil)
        login.view.removeFromSuperview()
        login.removeFromParentViewController()
        
        // Show tab bar
        bottomTabBarConstraint.constant = 0.0
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .BeginFromCurrentState, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        // Reload all controllers
        for vc in viewControllers {
            vc.reload(true)
        }
    }
    
    // Tab Bar delegate
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if let index = tabBar.items?.indexOf(item) {
            scrollTo(Int(index), animated: true)
        }
    }
}


extension ViewController : Routes {
    func processLogin(token: String, uid: String) {
        loginViewController?.processLogin(token, uid: uid)
    }
}

