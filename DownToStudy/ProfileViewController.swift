//
//  ProfileViewController.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import TagListView

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
        
    @IBOutlet weak var tagListView: TagListView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePicture.layer.shadowOffset = CGSize(width: 0, height: 4)
        profilePicture.layer.shadowOpacity = 0.4
        profilePicture.layer.shadowColor = UIColor.blackColor().CGColor
        profilePicture.layer.shadowRadius = 2
        
        // Go ahead and set the profile picture
        tagListView.backgroundColor = UIColor.clearColor()
        tagListView.textFont = UIFont.systemFontOfSize(16)
        tagListView.shadowRadius = 2
        tagListView.shadowOpacity = 0.4
        tagListView.shadowColor = UIColor.blackColor()
        tagListView.shadowOffset = CGSize(width: 0, height: 4)
        tagListView.alignment = .Center
        
        let math100 = tagListView.addTag("MATH 110")
        math100.backgroundColor = UIColor(red:0.13, green:0.58, blue:0.95, alpha:1.00)
        math100.layer.cornerRadius = 6
        
        let bio101 = tagListView.addTag("BIO 101")
        bio101.backgroundColor = UIColor(red:0.29, green:0.68, blue:0.31, alpha:1.00)
        bio101.layer.cornerRadius = 6
        
        let pol101 = tagListView.addTag("POL 101")
        pol101.backgroundColor = UIColor(red:0.00, green:0.58, blue:0.53, alpha:1.00)
        pol101.layer.cornerRadius = 6
        
        let nutr175 = tagListView.addTag("NUTR 175")
        nutr175.backgroundColor = UIColor(red:0.95, green:0.26, blue:0.21, alpha:1.00)
        nutr175.layer.cornerRadius = 6
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let userId = UserDefaultsManager.getString("uid")
        let profilePictureURL = String(format: "https://www.getstudyroom.com/api/accounts/avatar/%@?s=200", userId!)
        profilePicture.downloadAndSet(profilePictureURL, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Page Controller protocol
    override func reload(animated: Bool) -> Void {
    }

}
