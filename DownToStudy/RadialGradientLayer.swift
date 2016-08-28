//
//  RadialGradientLayer.swift
//  DownToStudy
//
//  Created by Haider Khan on 8/27/16.
//  Copyright © 2016 ZkHaider. All rights reserved.
//

import UIKit

class RadialGradientLayer: CALayer {
    
    // Variables 
    var center: CGPoint = CGPointMake(50, 50)
    var radius: CGFloat = 20
    var colors:[CGColor] = [UIColor(red: 251/255, green: 237/255, blue: 33/255, alpha: 1.0).CGColor , UIColor(red: 251/255, green: 179/255, blue: 108/255, alpha: 1.0).CGColor]

    override init() {
        super.init()
    }
    
    init(center: CGPoint, radius: CGFloat, colors: [CGColor]) {
        self.center = center
        self.radius = radius
        self.colors = colors
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawInContext(ctx: CGContext) {
        
        // Save our CG context
        CGContextSaveGState(ctx)
        
        // Color space and locations
        var colorSpace = CGColorSpaceCreateDeviceRGB()
        var locations:[CGFloat] = [0.0, 1.0]
        
        // Create gradient
        var gradient = CGGradientCreateWithColors(colorSpace, colors, [0.0,1.0])

        // Start and end points
        var startPoint = CGPointMake(0, self.bounds.height)
        var endPoint = CGPointMake(self.bounds.width, self.bounds.height)
        
        // Draw CG context
        CGContextDrawRadialGradient(ctx, gradient, center, 0.0, center, radius, 0)
        
    }

}
