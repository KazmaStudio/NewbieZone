//
//  UICommon.swift
//  NewbieZone
//
//  Created by zhaochenjun on 15/12/30.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

var ScreenWith = UIScreen.mainScreen().bounds.width

var ScreenHeight = UIScreen.mainScreen().bounds.height

func rgba (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor { return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }

func frame (x:CGFloat, y:CGFloat, w:CGFloat, h:CGFloat) -> CGRect { return CGRectMake(x, y, w, h)}
