//
//  RadarViewController.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class RadarViewController: UIViewController {
    
    @IBOutlet var radar: Radar!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Hardcoded array of people if we're not authenticated
        var images = [String]()
        images.append("https://www.getstudyroom.com/api/accounts/avatar/431794?s=200")
        images.append("https://www.getstudyroom.com/api/accounts/avatar/632705?s=200")
        images.append("https://www.getstudyroom.com/api/accounts/avatar/715677?s=200")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/822782/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/244270/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/738450/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/917808/None/original.jpeg")
        images.append("https://luma-ef-prod.s3.amazonaws.com/user/264314/None/original.jpeg")
        radar.update(images)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.sendSubviewToBack(radar)
        restartRotatingIfNeeded()
    }
    
    func restartRotatingIfNeeded() -> Void {
        if !radar.isRotating() {
            rotateRadar()
        }
    }
    
    func rotateRadar() -> Void {
        radar.startRotation()
    }

}
