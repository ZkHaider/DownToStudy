//
//  APIService.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation
import Moya

let APIProvider = MoyaProvider<APIService>()

public enum APIService {
    case login(userName: String)
    case getSchool(token: String)
}



extension APIService : TargetType {
    public var baseURL : NSURL { return NSURL(string: "http://studyroom.com/")! }
}