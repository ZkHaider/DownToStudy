//
//  DownToStudyService.swift
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

private let endpointClosure = { (target: DownToStudyService) -> Endpoint<DownToStudyService> in
    let url = target.baseURL.URLByAppendingPathComponent(target.path).absoluteString
    var endpoint: Endpoint<DownToStudyService> = Endpoint<DownToStudyService>(URL: url, sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
    return endpoint
}

// Provider
public let DownToStudyProvider = MoyaProvider<DownToStudyService>(endpointClosure: endpointClosure, plugins: [NetworkLoggerPlugin(verbose: true)])

public enum DownToStudyService {
    case getPeopleNearby(lat: Double, long: Double)
    case getAvailableEvents()
    case createEvent(courseId: String, timeStamp: String, locationName: String, maxStudents: Int)
    case postMessage(eventId: String, text: String)
    case getMessages(eventId: String)
}

extension DownToStudyService : TargetType {
    
    // Base Url endpoint to hit
    public var baseURL: NSURL {
        return NSURL(string: "https://www.getdowntostudy.com/api")!
    }
    
    // Path to hit
    public var path: String {
        switch self {
        case .getAvailableEvents:
            return ""
        case .createEvent:
            return ""
        case .getMessages:
            return ""
        case .getPeopleNearby:
            return ""
        case .postMessage:
            return ""
        }
    }
    
    public var method: Moya.Method {
        return .GET
    }
    
    public var parameters: [String: AnyObject]? {
        return nil
    }
    
    public var sampleData: NSData {
        switch self {
        case .createEvent:
            return "Sample Data".dataUsingEncoding(NSUTF8StringEncoding)!
        case .getAvailableEvents:
            let path = NSBundle.mainBundle().pathForResource("available_events", ofType: "json")
            return NSFileManager.defaultManager().contentsAtPath(path!)!
        case .getMessages:
            return "Sample Data".dataUsingEncoding(NSUTF8StringEncoding)!
        case .getPeopleNearby:
            let path = NSBundle.mainBundle().pathForResource("nearby_people", ofType: "json")
            return NSFileManager.defaultManager().contentsAtPath(path!)!;
        case .postMessage:
            return "Sample Data".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
    
    public var multipartBody: [MultipartFormData]? {
        return nil
    }
    
}