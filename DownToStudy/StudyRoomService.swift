//
//  StudyRoomService.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation
import Moya

private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

// Provider
public let StudyRoomProvider = MoyaProvider<StudyRoomService>()

// Client id
let ClientId = ""

public enum StudyRoomService {
    case accountInfo()
    case getCourses(String, Int);
}

extension StudyRoomService : TargetType {
    
    // Base Url endpoint to hit
    public var baseURL: NSURL {
        return NSURL(string: "https://www.getstudyroom.com/api")!
    }

    // Path to hit 
    public var path: String {
        switch self {
            case .accountInfo():
                return ("/accounts/info/")
            case .getCourses(let annotate, let filter):
                return ("/world/my-courses?annotate=\(annotate)&filter=\(filter)")
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .accountInfo:
            return .GET
        case .getCourses:
            return .GET
        }
    }
    
    public var parameters: [String: AnyObject]? {
        return nil
    }
    
    public var sampleData: NSData {
        switch self {
        case .accountInfo:
            return "Sample Data".dataUsingEncoding(NSUTF8StringEncoding)!
        case .getCourses:
            return "Sample Courses".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
    
    public var multipartBody: [MultipartFormData]? {
        return nil
    }
    
}