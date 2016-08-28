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
            userPicture1.layer.borderWidth = 2
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
