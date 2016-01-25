//
//  UITableView+XIBEdit.m
//  customerclient
//
//  Created by Zhao Chenjun on 15/7/1.
//  Copyright (c) 2015年 zhiqin. All rights reserved.
//

#import "UITableView+XIBEdit.h"

@implementation UITableView (UIViewTableExtend)

@dynamic insetTop,insetLeft,insetBottom,insetRight;

-(void)setInsetTop:(float)insetTop{
    self.contentInset = UIEdgeInsetsMake(insetTop, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
}

-(void)setInsetLeft:(float)insetLeft{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, insetLeft, self.contentInset.bottom, self.contentInset.right);
}

-(void)setInsetRight:(float)insetRight{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom, insetRight);
}

-(void)setInsetBottom:(float)insetBottom{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, insetBottom, self.contentInset.right);
}
@end
