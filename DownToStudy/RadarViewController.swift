//
//  RadarViewController.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class RadarViewController: UIViewController, CreationViewControllerDelegate {
    
    @IBOutlet var radar: Radar!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var btnStudy: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Update UI
        reload(false)
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.sendSubviewToBack(radar)
        restartRotatingIfNeeded()
    }
    
    func startLoadingAnimation() -> Void {
        
    }
    
    func restartRotatingIfNeeded() -> Void {
        if !radar.isRotating() {
            rotateRadar()
        }
    }
    
    func rotateRadar() -> Void {
        radar.startRotation()
    }
    
    @IBAction func btnCreatePressed() {
        
        if let creation = storyboard?.instantiateViewControllerWithIdentifier("creationViewController") as? CreationViewController {
            creation.delegate = self
            presentViewController(creation, animated: true, completion: nil)
        }
        
    }
    
    // Page Controller protocol
    override func reload(animated: Bool) -> Void {
        
        if !animated {
            UIView.setAnimationsEnabled(false)
        }
        
        // Hardcoded array of people
        let images = demoImagePaths()
        radar.update(images)
        
        let isAuthenticated = director.isUserAuthenticated()
        if isAuthenticated {
            var delay = 0.0
            for sv in [titleLabel, subtitleLabel, btnStudy] {
                UIView.animateWithDuration(0.3, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .BeginFromCurrentState, animations: {
                    sv.alpha = 1.0
                    sv.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
                    }, completion: nil)
                delay += 1.0
            }
            
        } else {
        
            var delay = 0.0
            for sv in [titleLabel, subtitleLabel, btnStudy] {
                UIView.animateWithDuration(0.3, delay: delay, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .BeginFromCurrentState, animations: {
                    sv.alpha = 0.0
                    sv.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.75, 0.75)
                    }, completion: nil)
                delay += 1.0
            }
        }
        
        if !animated {
            UIView.setAnimationsEnabled(true)
        }
        
    }
    
    func demoImagePaths() -> [String] {
        var images = [String]()
        let isAuthenticated = director.isUserAuthenticated()
        if isAuthenticated {
            if let userID = director.userID() {
                images.append(director.urPathForProfilePic(userID))
            }
        }
        images.append("https://www.getstudyroom.com/api/accounts/avatar/431794?s=200")
        images.append("https://www.getstudyroom.com/api/accounts/avatar/632705?s=200")
        images.append("https://www.getstudyroom.com/api/accounts/avatar/715677?s=200")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/822782/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/244270/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/738450/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/917808/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/264314/None/original.jpeg")
        return images
    }
    
    // Creation view controller
    
    func creationDidCancel(creationController: CreationViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func creation(creationController: CreationViewController, didFinishWithEvent: Event) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
