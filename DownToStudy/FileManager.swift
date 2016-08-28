//
//  FileManager.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation
import Moya

class FileManager {
    
    func saveMoyaResponseToFile(response: Moya.Response, path: String) -> Bool {
        let fileManager = NSFileManager.defaultManager()
        return fileManager.createFileAtPath(path, contents: response.data, attributes: nil)
    }
    
    func getMoyaResponseFromFile(path: String) -> Bool {
        let fileManager = NSFileManager.defaultManager()
        return fileManager.file
    }
    
}