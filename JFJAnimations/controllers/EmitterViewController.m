//
//  EmitterViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "EmitterViewController.h"
#import "EmitterLayerView.h"
#import "RainView.h"
#import "SnowView.h"

@implementation EmitterViewController


- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 下雪
    EmitterLayerView  *snowView = [[SnowView alloc] initWithFrame:CGRectMake(0, 64, 200, 200)];
    [self.view addSubview:snowView];
    [snowView showWithEdge:YES];
    
    // 下雨
    EmitterLayerView  *rainView = [[RainView alloc] initWithFrame:CGRectMake(0,264, 200, 200)];
    [self.view addSubview:rainView];
    [rainView showWithEdge:NO];
    

}



@end
