//
//  Item.swift
//  ChangeClothesNaruto
//
//  Created by HuuLuong on 7/21/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class Item: UIImageView, UIGestureRecognizerDelegate {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup(){
        self.userInteractionEnabled = true
        self.multipleTouchEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        self.addGestureRecognizer(panGesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(onPinch))
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(onRotate))
        self.addGestureRecognizer(rotateGesture)
        rotateGesture.delegate = self
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func onPan(panGesture: UIPanGestureRecognizer){
        if (panGesture.state == .Began || panGesture.state == .Changed) {
            let point = panGesture.locationInView(self.superview)
            self.center = point
        }
    }
    
    func onPinch(pinchGesture: UIPinchGestureRecognizer){
        if let view = pinchGesture.view {
            view.transform = CGAffineTransformScale(view.transform, pinchGesture.scale, pinchGesture.scale)
            pinchGesture.scale = 1
        }
    }
    
    func onRotate(rotateGesture: UIRotationGestureRecognizer) {
        if let view = rotateGesture.view {
            view.transform = CGAffineTransformRotate(view.transform, rotateGesture.rotation)
            rotateGesture.rotation = 0
        }
    }
    
    
}
