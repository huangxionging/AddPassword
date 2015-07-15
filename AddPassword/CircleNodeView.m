//
//  CircleNodeView.m
//  AddPassword
//
//  Created by huangxiong on 15/7/13.
//  Copyright (c) 2015年 New_Life. All rights reserved.
//

#import "CircleNodeView.h"

@implementation CircleNodeView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.layer.cornerRadius = self.frame.size.height / 2;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor greenColor].CGColor;
        self.isSelected = NO;
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
