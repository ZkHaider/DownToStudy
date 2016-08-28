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
    
    
    func update(imagePaths: [NSString]) -> Void {
        // Update the image views with the images to download from imagePaths
        
    }
    
    func startRotation() -> Void {
        // Rotate slowly
        
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
    
    func rotateAround(point: CGPoint, duration: CFTimeInterval) -> Void {
        
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
