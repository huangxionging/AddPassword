//
//  HXLinear.m
//  AddPassword
//
//  Created by huangxiong on 15/7/13.
//  Copyright (c) 2015年 New_Life. All rights reserved.
//

#import "HXLinear.h"

@implementation HXLinear


- (instancetype)initWithStart:(CGPoint)start AndEnd:(CGPoint)end {
    self = [super init];
    
    if (self) {
        self.start = start;
        self.end = end;
    }
    return self;
}

@end
