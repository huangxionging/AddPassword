//
//  ViewController.m
//  AddPassword
//
//  Created by huangxiong on 15/7/11.
//  Copyright (c) 2015年 New_Life. All rights reserved.
//

#import "ViewController.h"
#import "EncryptionView.h"
#import "CircleNodeView.h"
#import "HXLinear.h"

@interface ViewController ()

@property (nonatomic, assign) CGPoint start;

@property (nonatomic, assign) CGPoint end;

@property (nonatomic, strong) NSMutableArray *linearArray;

@property (nonatomic, strong) EncryptionView *encryptionView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _encryptionView = [[EncryptionView alloc] initWithFrame: CGRectMake(0, 10, 375, 400)];
    _encryptionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: _encryptionView];
    
//    NSInteger 
    
    
    // 按钮数量
    NSInteger count = 3;
    // 边界宽度
    NSInteger edgeWidth = 50;
    // 剩余最大宽度
    CGFloat maxLength = [[UIScreen mainScreen] bounds].size.width - edgeWidth;
    // 按钮占位宽度
    CGFloat width = maxLength / count;
    
    for (NSInteger index = 0; index < 9; ++index) {
        CircleNodeView  *nodeView = [[CircleNodeView alloc] initWithFrame: CGRectMake(edgeWidth + (index % count) * width, edgeWidth + (index / 3) * width, width - edgeWidth, width - edgeWidth)];
        nodeView.tag = index + 1;
        [_encryptionView addSubview: nodeView];
    }
    
    if (_linearArray == nil) {
        _linearArray = [[NSMutableArray alloc] initWithCapacity: 10];
    }
    
    
//    [UIView animateWithDuration: 0.3 delay: 0.1 options:UIViewAnimationOptionOverrideInheritedCurve animations:^{
//        
//        _encryptionView.transform = CGAffineTransformScale(_encryptionView.transform, 0.5, 0.5);
//        _encryptionView.transform = CGAffineTransformRotate(_encryptionView.transform, M_PI_4 / 4);
//    } completion:^(BOOL finished) {
//        
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CGPoint point = [[touches anyObject] locationInView: _encryptionView];
    
    NSInteger locationX = (point.x - 10) / 110;
    NSInteger locationY = (point.y - 10) / 110;
    
    CircleNodeView *nodeView = (CircleNodeView *)[_encryptionView hitTest:point withEvent: event];
    
    if ([nodeView class] == [CircleNodeView class] && nodeView.isSelected == NO) {
        nodeView.backgroundColor = [UIColor redColor];
        _start = nodeView.center;
        nodeView.isSelected = YES;
        HXLinear *linear = [[HXLinear alloc] initWithStart: _start AndEnd: _start];
        [_linearArray addObject: linear];
    }
//    if (locationX <= 3 && locationY <= 3) {
//        
//    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView: _encryptionView];
    
    NSInteger locationX = (point.x - 10) / 110;
    NSInteger locationY = (point.y - 10) / 110;
    
    HXLinear *linear = [_linearArray lastObject];
    linear.end = point;
    
    CircleNodeView *nodeView = (CircleNodeView *)[_encryptionView hitTest:point withEvent: event];
    
    if ([nodeView class] == [CircleNodeView class] && nodeView.isSelected == NO) {
        nodeView.backgroundColor = [UIColor redColor];
        nodeView.isSelected = YES;
        _end = nodeView.center;
        HXLinear *linear = [_linearArray lastObject];
        linear.end = _end;
        _start = _end;
        HXLinear *linearNext = [[HXLinear alloc] initWithStart: _start AndEnd: _start];
        [_linearArray addObject: linearNext];
        
        
    }
    _encryptionView.linearArray = _linearArray;
    [_encryptionView setNeedsDisplay];
}


- (void) addLayer {
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    [_encryptionView.layer addSublayer: layer];
    
   // layer.path
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [_linearArray removeAllObjects];
    
    for (NSInteger index = 0; index < 9; ++index) {
        CircleNodeView  *nodeView = (CircleNodeView *)[_encryptionView viewWithTag: index + 1];
        nodeView.backgroundColor = [UIColor clearColor];
        nodeView.isSelected = NO;
    }
    [_encryptionView setNeedsDisplay];
}


@end
