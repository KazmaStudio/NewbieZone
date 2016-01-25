//
//  UIView+XIBEdit.m
//  client
//
//  Created by ZHAOCHENJUN on 15/5/31.
//  Copyright (c) 2015年 zhiqin. All rights reserved.
//

#import "UIView+XIBEdit.h"

@implementation UIView (UIViewExtend)

@dynamic borderColor,borderWidth,cornerRadius,shadowColor,shadowOffset,shadowRadius;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setBorderColor:(UIColor *)borderColor{
	[self.layer setBorderColor:borderColor.CGColor];
}

-(void)setBorderWidth:(NSInteger)borderWidth{
	[self.layer setBorderWidth:borderWidth];
}

-(void)setCornerRadius:(NSInteger)cornerRadius{
	[self.layer setCornerRadius:cornerRadius];
}

-(void)setShadowColor:(UIColor *)shadowColor{
	[self.layer setShadowColor:shadowColor.CGColor];
}

-(void)setShadowOffset:(CGSize)shadowOffset{
	[self.layer setShadowOffset:shadowOffset];
}

-(void)setShadowRadius:(NSInteger)shadowRadius{
	[self.layer setShadowRadius:shadowRadius];
}


@end
