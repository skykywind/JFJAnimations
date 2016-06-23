//
//  JFJAnimationManger.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/17.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "JFJAnimationManager.h"
#import "YXEasing.h"
@implementation JFJAnimationManager : NSObject

//typedef void (^Complete)();


// 放大动画
+ (void)animationSmallToBigView:(UIView *)view duration:(NSTimeInterval)duration {
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.duration = duration;
    animation.keyPath = @"bounds.size";
    
    // 这里默认 30帧每秒
    CGFloat scale = 0.8f;
    animation.values = [YXEasing calculateFrameFromSize:CGSizeMake(view.bounds.size.width *scale, view.bounds.size.height *scale) toSize:view.bounds.size func:ElasticEaseOut frameCount:30 *duration];
    
    [view.layer addAnimation:animation forKey:nil];
    
}

// 绕中心旋转动画
+ (void)animationCenterRotateView:(UIView *)view duration:(NSTimeInterval)duration {
    
    [JFJAnimationManager animationAnchorPointRotateView:view anchorPiont:CGPointMake(0.5, 0.5) duration:duration];
}

// 绕锚点旋转动画
+ (void)animationAnchorPointRotateView:(UIView *)view anchorPiont:(CGPoint)anchor duration:(NSTimeInterval)duration {
    CGFloat oldValue = DEGREES_TO_RADIANS(0);
    CGFloat newValue = DEGREES_TO_RADIANS(360);
    NSArray *values = [YXEasing calculateFrameFromValue:oldValue toValue:newValue func:ElasticEaseOut frameCount:30 * duration];
    
    [JFJAnimationManager rotateView:view duration:duration values:values anchorPiont:anchor repeat:NO axis:E_Z_Axis autoreverses:NO];
}

// 抖动动画
+ (void)animationShakeView:(UIView *)view repeat:(BOOL)repeat {
    
    NSArray *values = @[@(DEGREES_TO_RADIANS(-5)), @(DEGREES_TO_RADIANS(5)), @(DEGREES_TO_RADIANS(-5)), @(DEGREES_TO_RADIANS(0))];
    [JFJAnimationManager rotateView:view duration:0.25 values:values anchorPiont:CGPointMake(0.5, 0.5) repeat:repeat axis:E_Z_Axis autoreverses:NO];
}

// 翻转动画 默认绕x轴
+ (void)animationFlipView:(UIView *)view axis:(EAxis)axis repeat:(BOOL)repeat duration:(NSTimeInterval)duration{
    NSArray *values = @[[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:1.0 * M_PI]];
    [JFJAnimationManager rotateView:view duration:duration values:values anchorPiont:CGPointMake(0.5, 0.5) repeat:repeat axis:axis autoreverses:YES];
}

// 旋转动画
+ (void)rotateView:(UIView*)view duration:(NSTimeInterval)duration values:(NSArray *)values anchorPiont:(CGPoint)anchor repeat:(BOOL)repeat axis:(EAxis)axis autoreverses:(BOOL)autoreverses{

    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    NSString *axisStyle = @"transform.rotation.x";
    
    switch (axis) {
        case E_X_Axis:
            axisStyle = @"transform.rotation.x";
            break;
        case E_Y_Axis:
            axisStyle = @"transform.rotation.y";
            break;
        case E_Z_Axis:
            axisStyle = @"transform.rotation.z";
            break;
            
        default:
            axisStyle = @"transform.rotation.x";
            break;
    }
    animation.keyPath = axisStyle;
    animation.values = values;
    animation.duration = duration;
    animation.autoreverses = autoreverses;
    // 动画次数设置为最大
    animation.repeatCount = repeat ? MAXFLOAT : 0;
    // 保持动画执行完毕后的状态
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    view.layer.anchorPoint = anchor;
    [view.layer addAnimation:animation forKey:nil];
    
}

// 从起始位置移动到endPoint的位置
+ (void)animationPositionView:(UIView *)view toPoint:(CGPoint)endPoint duration:(NSTimeInterval)duration function:(AHEasingFunction)func {
    
    AHEasingFunction useFunc = func ? func : CubicEaseOut;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = duration;
    animation.values = [YXEasing calculateFrameFromPoint:view.center toPoint:endPoint func:useFunc frameCount:duration *30];
    
    view.center = endPoint;
    
    [view.layer addAnimation:animation forKey:nil];
}

// iOS9 CASpringAnimation的使用
+ (void)springAnimation:(UIView *)view keyPath:(NSString *)keyPath fromValue:(NSValue *)fromValue toValue:(NSValue *)toValue damping:(CGFloat)damping stiffness:(CGFloat)stiffness mass:(CGFloat)mass initialVelocity:(CGFloat)initialVelocity {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        CASpringAnimation *animation = [CASpringAnimation animationWithKeyPath:keyPath];
        animation.damping = damping;
        animation.stiffness = stiffness;
        animation.initialVelocity = initialVelocity;
        animation.mass = mass;
        animation.fromValue = fromValue;
        animation.toValue = toValue;
        animation.removedOnCompletion = NO;
        animation.fillMode = kCAFillModeForwards;
        //动画时间设置为估算时间（系统根据所有参数计算）
        animation.duration = animation.settlingDuration; //动画时间设置为估算时间
        [view.layer addAnimation:animation forKey:nil];
    }
}


// 停止（移除）动画
+ (void)stopAnimation:(UIView *)view delay:(NSTimeInterval)delayTime{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view.layer removeAllAnimations];
    });
}

@end
