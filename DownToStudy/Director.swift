//
//  Director.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation

class Director: NSObject {
    
    var demoStudents = [User]()
    
    override init() {
        demoStudents.append(User(uid: "431794", name: "Emerson Malca", school: nil, classes: nil))
        demoStudents.append(User(uid: "632705", name: "Emerson Malca", school: nil, classes: nil))
        demoStudents.append(User(uid: "715677", name: "Emerson Malca", school: nil, classes: nil))
        demoStudents.append(User(uid: "822782", name: "Emerson Malca", school: nil, classes: nil))
        demoStudents.append(User(uid: "244270", name: "Emerson Malca", school: nil, classes: nil))
        demoStudents.append(User(uid: "738450", name: "Emerson Malca", school: nil, classes: nil))
        demoStudents.append(User(uid: "917808", name: "Emerson Malca", school: nil, classes: nil))
        demoStudents.append(User(uid: "264314", name: "Emerson Malca", school: nil, classes: nil))
    }
 
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
