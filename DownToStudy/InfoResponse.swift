//
//  InfoResponse.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation
import SwiftyJSON

final class InfoResponse: ALSwiftyJSONable {

    // Go ahead and map out the attributes 
    let uid: String?
    let showTutors: Bool?
    let isTutor: Bool?
    let showMentors: Bool?
    let hasPassword: Bool?
    
    
}
