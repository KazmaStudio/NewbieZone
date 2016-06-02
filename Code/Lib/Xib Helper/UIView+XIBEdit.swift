//
//  UIView+XIBEdit.swift
//  NewbieZone
//
//  Created by zhaochenjun on 15/12/29.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get {
            
            return layer.cornerRadius
        
        }
        
        set {
        
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        
        get {
            
            return layer.shadowOffset
            
        }
        
        set {
            layer.shadowRadius = 2
            layer.shadowOpacity = 0.3
            layer.shadowOffset = newValue
            layer.masksToBounds = false
            
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        
        get {
        
            return layer.borderWidth
        
        }
        
        set {
        
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    
}