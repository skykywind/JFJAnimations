//
//  JFJAnimationController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/20.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "JFJAnimationController.h"

@implementation JFJAnimationController


// 转场动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

// 
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {

    // context 中包含了controller和view
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    // 设置终点和起点位置
    // fromView的
    CGRect fromStartFrame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect fromEndFrame = fromStartFrame;
    
    // toView的
    CGRect endFrame = [transitionContext finalFrameForViewController:toViewController];
    CGRect startFrame = endFrame;
    
    //占位view
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    
    if (self.operation == UINavigationControllerOperationPush) {
        startFrame.origin.y -= endFrame.size.height;
    } else if (self.operation == UINavigationControllerOperationPop) {
        fromEndFrame.origin.y -=fromStartFrame.size.height;
        [containerView sendSubviewToBack:toView];
    }
    
    fromView.frame = fromStartFrame;
    toView.frame = startFrame;
    
    // 动画开始
    [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
        toView.frame = endFrame;
        fromView.frame = fromEndFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    
}

@end
