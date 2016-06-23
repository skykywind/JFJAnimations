//
//  DelayViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/20.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "DelayViewController.h"
#import "JFJAnimationManager.h"


@implementation DelayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    showBtn.frame = CGRectMake(10, 64, 60, 60);
    showBtn.backgroundColor = [UIColor cyanColor];
    [showBtn setTitle:@"函数弹簧" forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
    
    UIButton *showBtn2 = [UIButton buttonWithType:UIButtonTypeSystem];
    showBtn2.frame = CGRectMake(100, 64, 60, 60);
    showBtn2.backgroundColor = [UIColor cyanColor];
    [showBtn2 setTitle:@"系统弹簧" forState:UIControlStateNormal];
    [showBtn2 addTarget:self action:@selector(startAnimation2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn2];
    
    UIButton *showBtn3 = [UIButton buttonWithType:UIButtonTypeSystem];
    showBtn3.frame = CGRectMake(190, 64, 60, 60);
    showBtn3.backgroundColor = [UIColor cyanColor];
    [showBtn3 setTitle:@"函数衰减" forState:UIControlStateNormal];
    [showBtn3 addTarget:self action:@selector(startAnimation3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn3];
    
    
}

- (void)startAnimation:(UIButton *)sender {
    
    // ElasticEaseOut 模仿弹性动画
    [JFJAnimationManager animationPositionView:sender toPoint:CGPointMake(40, 400) duration:2.f function:ElasticEaseOut];
    
}
- (void)startAnimation2:(UIButton *)sender {
    // 系统弹簧动画
    [JFJAnimationManager springAnimation:sender keyPath:@"position" fromValue:[NSValue valueWithCGPoint:sender.center] toValue:[NSValue valueWithCGPoint: CGPointMake(130, 400)] damping:5.f stiffness:100.f mass:1.f initialVelocity:0.f];
}
- (void)startAnimation3:(UIButton *)sender {
    
     // CubicEaseOut   模仿衰减动画
    [JFJAnimationManager animationPositionView:sender toPoint:CGPointMake(210, 400) duration:2.f function:CubicEaseOut];
}
@end
