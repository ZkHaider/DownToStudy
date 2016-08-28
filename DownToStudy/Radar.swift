//
//  Radar.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import QuartzCore

class Radar: UIView {
    
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    @IBOutlet var imageFive: UIImageView!
    
    
    func update(imagePaths: [String]) -> Void {
        // Update the image views with the images to download from imagePaths
        let session = NSURLSession.sharedSession()
        for (index, imageView) in [mainImage, imageOne, imageTwo, imageThree, imageFour, imageFive].enumerate() {
            if index > imagePaths.count {
                continue
            }
            
            imageView.alpha = 0
            imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.75, 0.75)
            
            let path = imagePaths[index]
            let url = NSURL(string: path)
            if let safeURL = url {
                let task = session.dataTaskWithURL(safeURL) { (data, response, error) -> Void in
                    
                    if let safeData = data {
                        let image = UIImage.init(data: safeData)
                        
                        // Pop them in
                        dispatch_async(dispatch_get_main_queue()) {
                            imageView.image = image
                            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .BeginFromCurrentState, animations: {
                                imageView.alpha = 1.0
                                imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
                                }, completion: nil)
                        }
                    }
                    
                }
                task.resume()
            }
        }
    }
    
    func startRotation() -> Void {
        // Rotate slowly
        let centerPoint = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        for imageView in [imageOne, imageTwo, imageThree, imageFour, imageFive] {
            imageView.rotateAround(centerPoint, duration: 60.0)
        }
        
    }
}

let rotationAnimationKey = "rotateAnimation"

extension UIView {
    
    func isRotating() -> Bool {
        
        if layer.animationForKey(rotationAnimationKey) != nil {
            return true
        }
        
        return false
    }
    
    func rotateAround(center: CGPoint, duration: CFTimeInterval) -> Void {
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.calculationMode = kCAAnimationPaced
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = Float.infinity
        //Calculate the path based on the current center of the view and the desired center
        let curvedPath = CGPathCreateMutable()
        let point = self.center
        let total = (point.x - center.x) * (point.x - center.x) + (point.y - center.y) * (point.y - center.y)
        let radius = sqrtf(Float(total))
        let startAngle = atan2f(Float(point.y - center.y), Float(point.x - center.x))
        print("Starting rotation at angle \(startAngle).4")
        CGPathAddArc(curvedPath, nil, center.x, center.y, CGFloat(radius), CGFloat(startAngle), CGFloat(M_PI) * 2.0 + CGFloat(startAngle) + 0.1, true)
        CGPathCloseSubpath(curvedPath)
        animation.path = curvedPath
        self.layer.addAnimation(animation, forKey:rotationAnimationKey)
        
    }
}
