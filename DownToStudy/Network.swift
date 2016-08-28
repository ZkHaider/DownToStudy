//
//  Network.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

struct Network {
    
    static let provider = MoyaProvider(endpointClosure: Endpoint)
    
    static func request(target: StudyRoomService,
                        success: (JSON) -> Void,
                        failure: (Moya.Error) -> Void,
                        error: (status: Int) -> Void) {
        
    }
    
}