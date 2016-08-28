//
//  Routes.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import Foundation

protocol Routes: class {
    func processLogin(token: String, uid: String)
}