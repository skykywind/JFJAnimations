//
//  FlipViewConreoller.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/20.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "FlipViewConreoller.h"
#import "JFJAnimationManager.h"
@implementation FlipViewConreoller
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    showBtn.frame = CGRectMake(10, 64, 60, 60);
    showBtn.center = self.view.center;
    showBtn.backgroundColor = [UIColor cyanColor];
    [showBtn setTitle:@"点我" forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showBtn];
    
    
}

- (void)startAnimation:(UIButton *)sender {
    
    [JFJAnimationManager animationFlipView:sender axis:E_Y_Axis repeat:NO duration:1.f];
    
}
@end
