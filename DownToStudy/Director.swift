//
//  Director.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation

class Director: NSObject {
    
    func isUserAuthenticated() -> Bool {
        let token = UserDefaultsManager.getString("token", defaultValue: "")
        return token != nil && token?.characters.count > 0
    }
    
    func userID() -> String? {
        let uid = UserDefaultsManager.getString("uid", defaultValue: "")
        if uid != nil && uid?.characters.count > 0 {
            return uid
        }
        return nil
    }
    
    func urPathForProfilePic(userID: String) -> String {
        return "https://www.getstudyroom.com/api/accounts/avatar/\(userID)?s=200"
    }

}
