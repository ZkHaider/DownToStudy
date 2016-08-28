//
//  DetailEventViewController.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class DetailEventViewController: UIViewController {
    
    @IBOutlet weak var textFieldContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelTwo: UILabel!
    @IBOutlet weak var infoContainer: UIView!
    @IBOutlet weak var avatarsContainer: UIView!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var spotsLabel: UILabel!
    
    var event: Event!
    
    @IBOutlet weak var userPicture1: UIImageView! {
        didSet {
            userPicture1.layer.borderWidth = 3
            userPicture1.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    @IBOutlet weak var userPicture2: UIImageView! {
        didSet {
            userPicture2.layer.borderWidth = 2
            userPicture2.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    @IBOutlet weak var userPicture3: UIImageView! {
        didSet {
            userPicture3.layer.borderWidth = 2
            userPicture3.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    @IBOutlet weak var userPicture4: UIImageView! {
        didSet {
            userPicture4.layer.borderWidth = 2
            userPicture4.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    @IBOutlet weak var userPicture5: UIImageView! {
        didSet {
            userPicture5.layer.borderWidth = 2
            userPicture5.layer.borderColor = UIColor.whiteColor().CGColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldContainer.layer.borderWidth = 1.0;
        textFieldContainer.layer.borderColor = UIColor.lightGrayColor().CGColor
        textFieldContainer.layer.shadowColor = UIColor.lightGrayColor().CGColor
        textFieldContainer.layer.shadowRadius = 10.0
        textFieldContainer.layer.shadowOpacity = 0.35
        
        titleLabel.text = event.eventClass?.name
        titleLabelTwo.text = event.eventClass?.name
        
        locationLabel.text = "Meeting @ \(event.locationName!)"
        if let spots = event.availableSpots {
            switch spots {
            case 0:
                spotsLabel.text = "No spots available"
                break
            case 1:
                spotsLabel.text = "1 spot available"
                break
            default:
                spotsLabel.text = "\(spots) spots available"
                break
            }
        }
        
        let userCount = event.students.count
        for (index, sv) in [userPicture1, userPicture2, userPicture3, userPicture4, userPicture5].enumerate() {
            if index < userCount {
                sv.alpha = 1.0
                let student = event.students[index]
                if let uid = student.uid {
                    let path = director.urPathForProfilePic(uid)
                    sv.downloadAndSet(path, completion: nil)
                }
            } else {
                sv.alpha = 0.0
            }
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func btnClosePressed() {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
