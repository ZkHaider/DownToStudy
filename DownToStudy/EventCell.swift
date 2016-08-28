//
//  EventCell.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    // Initialize our views
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
    
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var spotsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(event: Event) -> Void {
        courseLabel.text = event.eventClass?.name
        locationLabel.text = "Meeting @ \(event.locationName!)"
        if let spots = event.availableSpots {
            switch spots {
            case 0:
                spotsLabel.text = "No spots available"
                return
            case 1:
                spotsLabel.text = "1 spot available"
                return
            default:
                spotsLabel.text = "\(spots) spots available"
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
        
    }

}
