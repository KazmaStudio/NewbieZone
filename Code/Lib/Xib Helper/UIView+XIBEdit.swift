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
    
    @IBInspectable var borderWidth: CGFloat {
        
        get {
        
            return layer.borderWidth
        
        }
        
        set {
        
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        
        }
    }
    
    @IBInspectable var borderBottom: Bool {

        get{
            
            return false
            
        }

        set {
            
            if(newValue){
                
                self.layoutSubviews();
                
                let bottomBorder: CALayer = CALayer()
                
                bottomBorder.frame = CGRect(x: 0.0, y: self.frame.height - 0.5, width: self.frame.width, height: 0.5)
                
                bottomBorder.backgroundColor = rgba(255, g: 255, b: 255, a: 1).CGColor
                
                self.layer.addSublayer(bottomBorder)
            
            }

        }
        

    }
    
}