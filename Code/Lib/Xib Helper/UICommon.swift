//
//  UICommon.swift
//  NewbieZone
//
//  Created by zhaochenjun on 15/12/30.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

// MARK: - Tag number
var TagCellHighlightView = 99901

// MARK: - Define
let ScreenWith = UIScreen.mainScreen().bounds.width

let ScreenHeight = UIScreen.mainScreen().bounds.height

let MainColor = UIColor (red: 255/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1)

func rgba (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor { return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }

func frame (x:CGFloat, y:CGFloat, w:CGFloat, h:CGFloat) -> CGRect { return CGRectMake(x, y, w, h)}

var ScreenScale = UIScreen.mainScreen().scale;

var px1 = 1 / ScreenScale

// MARK: - Function
func ShakeView(view : UIView){
    let shake = CABasicAnimation.init(keyPath: "position")
    shake.duration = 0.1
    shake.repeatCount = 2
    shake.autoreverses = true
    shake.fromValue = NSValue.init(CGPoint: CGPointMake(view.center.x - 3, view.center.y))
    shake.toValue = NSValue.init(CGPoint: CGPointMake(view.center.x + 3, view.center.y))
    view.layer.addAnimation(shake, forKey: "position")
}

func CellShouldHighlightAnimate(cell : UITableViewCell){
    let view = UIView.init(frame: frame(0, y: 0, w: cell.frame.size.width, h: cell.frame.size.height - 8))
    view.backgroundColor = rgba(0, g: 0, b: 0, a: 0)
    view.tag = TagCellHighlightView
    cell.contentView.addSubview(view)
    UIView.animateWithDuration(0.2, animations: {view.backgroundColor = rgba(0, g: 0, b: 0, a: 0.2)}, completion: {(value: Bool) in })
    
}

func CellDidUnHighlightAnimate(cell : UITableViewCell){
    let view = cell.contentView.viewWithTag(TagCellHighlightView)
    view!.backgroundColor = rgba(0, g: 0, b: 0, a: 0.2)
    UIView.animateWithDuration(0.2, animations: {view!.backgroundColor = rgba(0, g: 0, b: 0, a: 0)}, completion: {(value: Bool) in view!.removeFromSuperview()})
}








