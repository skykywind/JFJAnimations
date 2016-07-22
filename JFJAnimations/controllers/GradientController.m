//
//  GradientController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "GradientController.h"
#import "GradierntView.h"
@implementation GradientController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    GradierntView *view = [[GradierntView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    view.backgroundColor = [UIColor blackColor];
    view.center = self.view.center;
    view.direction = LEFT;
    view.color = [UIColor cyanColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    [view addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"展示一下这个view";
    label.textColor = [UIColor redColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [view addGestureRecognizer:tap];
    
    [self.view addSubview:view];
    
    
    [view animate :1.5f repeatCount:MAXFLOAT];
    
}

- (void)tap:(UITapGestureRecognizer *)tap {
 //   GradierntView *view = (GradierntView *)tap.view;
    
}
@end
