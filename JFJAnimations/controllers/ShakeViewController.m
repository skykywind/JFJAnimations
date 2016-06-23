//
//  ShakeViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/20.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "ShakeViewController.h"
#import "JFJAnimationManager.h"
@implementation ShakeViewController

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
    
    [JFJAnimationManager animationShakeView:sender repeat:NO];
    
}

@end
