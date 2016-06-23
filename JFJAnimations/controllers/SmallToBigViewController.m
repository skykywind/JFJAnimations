//
//  SmallToBigViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/20.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "SmallToBigViewController.h"
#import "JFJAnimationManager.h"

@implementation SmallToBigViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    showBtn.frame = CGRectMake(0, 0, 60, 60);
    showBtn.backgroundColor = [UIColor cyanColor];
    showBtn.center = self.view.center;
    [showBtn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:showBtn];
    
    [JFJAnimationManager animationSmallToBigView:showBtn duration:2.f];
    
}

- (void)startAnimation:(UIButton *)sender {
    
    [JFJAnimationManager animationSmallToBigView:sender duration:2.f];
}


@end
