//
//  CircleViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleProgreessView.h"

@interface CircleViewController ()
{
    CircleProgressView  *circle;
}
@end
@implementation CircleViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];

    
    circle = [[CircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) lineWidth:5 lineCorlor:[UIColor redColor] backColor:[UIColor yellowColor]];
    circle.center = self.view.center;
    [self.view addSubview:circle];
    
    
    UIButton *add = [UIButton buttonWithType:UIButtonTypeSystem];
    [add setTitle:@"+" forState:UIControlStateNormal];
    [add addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
    add.frame = CGRectMake(80, 100, 60, 30);
    [self.view addSubview:add];
    
    UIButton *reduce = [UIButton buttonWithType:UIButtonTypeSystem];
    [reduce setTitle:@"-" forState:UIControlStateNormal];
    [reduce addTarget:self action:@selector(reduceClick) forControlEvents:UIControlEventTouchUpInside];
    reduce.frame = CGRectMake(200, 100, 60, 30);
    [self.view addSubview:reduce];
    
}

- (void)addClick {
    if (circle.progress < 1.f) {
       circle.progress += 0.01f;
    }
}
- (void)reduceClick {
    if (circle.progress >= 0.01f) {
        circle.progress -= 0.01f;
    }
}
@end
