//
//  NVActivityIndicatorBallClipRotate.swift
//  NVActivityIndicatorViewDemo
//
//  Created by Nguyen Vinh on 7/23/15.
//  Copyright (c) 2015 Nguyen Vinh. All rights reserved.
//

import UIKit

class NVActivityIndicatorAnimationBallClipRotate: NVActivityIndicatorAnimationDelegate {
    
    func setUpAnimationInLayer(layer: CALayer, size: CGSize, color: UIColor) {
        let duration: CFTimeInterval = 0.75
        
        // Rotate animation
        let rotateAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        rotateAnimation.values = [0, M_PI, 2 * M_PI]
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [rotateAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        // Draw circle
        let circle = NVActivityIndicatorShape.RingThirdFour.createLayerWith(size: CGSize(width: size.width, height: size.height), color: color)
        let frame = CGRect(x: (layer.bounds.size.width - size.width) / 2,
            y: (layer.bounds.size.height - size.height) / 2,
            width: size.width,
            height: size.height)
        
        circle.frame = frame
        circle.addAnimation(animation, forKey: "animation")
        layer.addSublayer(circle)
    }
}
