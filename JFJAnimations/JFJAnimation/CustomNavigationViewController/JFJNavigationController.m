//
//  JFJNavigationController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/20.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "JFJNavigationController.h"
#import "JFJAnimationController.h"
@implementation JFJNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.delegate = self;

}

// UINavigationControllerDelegate的方法
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    JFJAnimationController *animationVC = [[JFJAnimationController alloc] init];
    animationVC.operation = operation;
    return animationVC;
    
}

@end
