//
//  DeviceUserResponse.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation
import ObjectMapper

struct DeviceUserResponse: Mappable {
    
    var apiKey: String?
    var uid: String?
    var uauth: String?
    var serverAuth: String?
    var questionReferralLink: String?
    var id: String?
    var referralLink: String?
    var promoCode: String?
    var first: String?
    var name: String?
    var email: String?
    var isSuperUser: Bool?
    var showTutors: Bool?
    var hasPush: Bool?
    var isStaff: Bool?
    var isTutor: Bool?
    var showMentors: Bool?
    var hasPassword: Bool?
    var hasAuthMethod: Bool?
    
    init?(_ map: Map) { }
    
    mutating func mapping(map: Map) {
        apiKey <- map["apiKey"]
        uid <- map["uid"]
        uauth <- map["uauth"]
        serverAuth <- map["serverAuth"]
        questionReferralLink <- map["questionReferralLink"]
        id <- map["id"]
        referralLink <- map["referralLink"]
        promoCode <- map["promoCode"]
        first <- map["first"]
        name <- map["name"]
        email <- map["email"]
        isSuperUser <- map["isSuperUser"]
        showTutors <- map["showTutors"]
        hasPush <- map["hasPush"]
        isStaff <- map["isStaff"]
        isTutor <- map["isTutor"]
        showMentors <- map["showMentors"]
        hasPassword <- map["hasPassword"]
        hasAuthMethod <- map["hasAuthMethod"]
    }
    
}