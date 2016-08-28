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

private let endpointClosure = { (target: StudyRoomService) -> Endpoint<StudyRoomService> in
    let url = target.baseURL.URLByAppendingPathComponent(target.path).absoluteString
    var endpoint: Endpoint<StudyRoomService> = Endpoint<StudyRoomService>(URL: url, sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
    
    let token = UserDefaultsManager.getString("token", defaultValue: "")
    let uid = UserDefaultsManager.getString("uid", defaultValue: "")
    
    if let t = token {
        if (t.characters.count > 0) {
            endpoint = endpoint.endpointByAddingHTTPHeaderFields(["X-User-Key": t])
        }
    }
    
    if let u = uid {
        if (u.characters.count > 0) {
            endpoint = endpoint.endpointByAddingHTTPHeaderFields(["X-User-Id": u])
        }
    }
    return endpoint
}

// Provider
public let StudyRoomProvider = MoyaProvider<StudyRoomService>(endpointClosure: endpointClosure, plugins: [NetworkLoggerPlugin(verbose: true)])

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