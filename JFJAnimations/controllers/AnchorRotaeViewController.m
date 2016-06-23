//
//  AnchorRotaeViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/20.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "AnchorRotaeViewController.h"
#import "JFJAnimationManager.h"
@implementation AnchorRotaeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *showBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    showBtn.frame = CGRectMake(0, 0, 60, 60);
    showBtn.backgroundColor = [UIColor cyanColor];
    showBtn.center = self.view.center;
    [showBtn setTitle:@"点我" forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:showBtn];
    
    [JFJAnimationManager animationAnchorPointRotateView:showBtn anchorPiont:CGPointMake(0, 0) duration:2.f];
    
}

- (void)startAnimation:(UIButton *)sender {
    [JFJAnimationManager animationAnchorPointRotateView:sender anchorPiont:CGPointMake(0, 0) duration:2.f];
}

@end
