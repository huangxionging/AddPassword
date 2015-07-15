//
//  HXLinear.h
//  AddPassword
//
//  Created by huangxiong on 15/7/13.
//  Copyright (c) 2015年 New_Life. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


@interface HXLinear : NSObject

@property (nonatomic, assign) CGPoint start;

@property (nonatomic, assign) CGPoint end;

- (instancetype)initWithStart: (CGPoint) start AndEnd: (CGPoint) end;

@end
