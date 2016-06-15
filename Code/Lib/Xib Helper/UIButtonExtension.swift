//
//  UIButtonExtension.swift
//  NewbieZone
//
//  Created by zhaochenjun on 16/6/15.
//  Copyright © 2016年 kazmastudio. All rights reserved.
//

import UIKit

extension UIButton {
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(color: UIColor, forUIControlState state: UIControlState) {
        self.setBackgroundImage(imageWithColor(color), forState: state)
    }
	
	func addGrayHighlightEffect()  {
		self.setBackgroundColor(rgba(0, g: 0, b: 0, a: 0.3), forUIControlState: .Highlighted)
	}
}