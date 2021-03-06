//
//  Event.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation

struct Event {
    let id : String?
    let name: String?
    let locationName: String?
    let availableSpots: Int?
    let eventClass: Class?
    var students = [User]()
    var joined: Bool?
    
    func hasJoined() -> Bool {
        if let userId = UserDefaultsManager.getString("uid") {
            for user in students {
                if (user.uid == userId) {
                    return true
                }
            }
        }
        return false
    }
    
}
