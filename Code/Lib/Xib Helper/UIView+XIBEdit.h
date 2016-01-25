//
//  UIView+XIBEdit.h
//  client
//
//  Created by ZHAOCHENJUN on 15/5/31.
//  Copyright (c) 2015年 zhiqin. All rights reserved.
//  扩展XIB中，继承于UIView的控件的可编辑属性

#import <UIKit/UIKit.h>

@interface UIView (UIViewExtend)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;
@property (nonatomic) IBInspectable NSInteger cornerRadius;
@property (nonatomic) IBInspectable UIColor *shadowColor;
@property (nonatomic) IBInspectable CGSize shadowOffset;
@property (nonatomic) IBInspectable NSInteger shadowRadius;

@end
