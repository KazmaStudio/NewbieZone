//
//  UICommon.swift
//  NewbieZone
//
//  Created by zhaochenjun on 15/12/30.
//  Copyright © 2015年 kazmastudio. All rights reserved.
//

import UIKit

let ScreenWith = UIScreen.mainScreen().bounds.width

let ScreenHeight = UIScreen.mainScreen().bounds.height

let MainColor = UIColor (red: 255/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1)

func rgba (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor { return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a) }

func frame (x:CGFloat, y:CGFloat, w:CGFloat, h:CGFloat) -> CGRect { return CGRectMake(x, y, w, h)}
