//
//  ProfileViewController.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Go ahead and set the profile picture
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
