//
//  Radar.swift
//  DownToStudy
//
//  Created by emersonmalca on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit
import QuartzCore
import Pulsator

class Radar: UIView {
    
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    @IBOutlet var imageFive: UIImageView!
    var didLoadHalo = false
    var halo: Pulsator?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !didLoadHalo {
            didLoadHalo = true
            
            let pulsator = Pulsator()
            pulsator.position = CGPoint.init(x: bounds.size.width/2.0, y: bounds.size.height/2.0)
            layer.insertSublayer(pulsator, atIndex: 0)
            pulsator.numPulse = 6
            pulsator.animationDuration = 12
            pulsator.pulseInterval = 0
            pulsator.radius = 240.0
            pulsator.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.65).CGColor
            halo = pulsator
        }
    }
    
    
    func update(imagePaths: [String]) -> Void {
        // Update the image views with the images to download from imagePaths
        for (index, imageView) in [mainImage, imageOne, imageTwo, imageThree, imageFour, imageFive].enumerate() {
            if index > imagePaths.count {
                continue
            }
            
            imageView.alpha = 0
            imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.75, 0.75)
            
            let path = imagePaths[index]
            imageView.downloadAndSet(path) {
                UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .BeginFromCurrentState, animations: {
                    imageView.alpha = 1.0
                    imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
                }, completion: nil)
            }
        }
    }
    
    func startRotation() -> Void {
        // Rotate slowly
        let centerPoint = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        for imageView in [imageOne, imageTwo, imageThree, imageFour, imageFive] {
            imageView.rotateAround(centerPoint, duration: 60.0)
        }
        
        bounceMainImage()
        
        //halo?.start()
        
    }
    
    func bounceMainImage() -> Void {
        
        UIView.animateWithDuration(0.3, animations: { [unowned self] in
            self.mainImage.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9)
            }, completion: { (finished: Bool) -> Void in
                UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.25, options: .BeginFromCurrentState, animations: { [unowned self] in
                    self.mainImage.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0)
                    }, completion: nil)
            })
        
        performSelector(#selector(Radar.bounceMainImage), withObject: nil, afterDelay: 5)
    }
}

let rotationAnimationKey = "rotateAnimation"

extension UIView {
    
    func isRotating() -> Bool {
        
        if let _ = layer.animationForKey(rotationAnimationKey) {
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
