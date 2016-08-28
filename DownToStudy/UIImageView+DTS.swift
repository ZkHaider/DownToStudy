//
//  UIImageView+DTS.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/28/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloadAndSet(imagePath: String, completion: (() -> Void)?) {
        
        let url = NSURL(string: imagePath)
        if let safeURL = url {
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(safeURL) { (data, response, error) -> Void in
                
                if let safeData = data {
                    let img = UIImage.init(data: safeData)
                    
                    // Pop them in
                    dispatch_async(dispatch_get_main_queue()) { [unowned self] in
                        self.image = img
                        if let block = completion {
                            block()
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
    
}
