//
//  EncryptionView.m
//  AddPassword
//
//  Created by huangxiong on 15/7/11.
//  Copyright (c) 2015年 New_Life. All rights reserved.
//

#import "EncryptionView.h"
#import "HXLinear.h"

@implementation EncryptionView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 10.0);
    
    for (NSInteger index = 0; index < _linearArray.count; ++index) {
        HXLinear *linear = _linearArray[index];
        CGContextMoveToPoint(ctx, linear.start.x, linear.start.y);
        CGContextAddLineToPoint(ctx, linear.end.x, linear.end.y);
    }
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextStrokePath(ctx);
}


@end
