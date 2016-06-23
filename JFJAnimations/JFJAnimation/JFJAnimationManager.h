//
//  JFJAnimationManger.h
//  JFJAnimations
//
//  Created by AtronJia on 16/6/17.
//  Copyright © 2016年 Artron. All rights reserved.
//
/**
 *  1，写此项目意在总结iOS中常用动画的实现，并非一一列举，大多参数在实现中设置了默认值（一般可满足我的需要），如果不能满足你的需求可以修改实现方法，或者开发者暴露需要自定义的参数。
 *  2，本项目部分动画使用了缓动函数设置path，EasingFiles/easing.png 简明显示了每个函数的曲线，开发者可以很方便的查阅修改自己的动画效果。
 *  3，本人只是个菜鸟新手，希望大家不吝赐教，沟通交流技术。
 */



#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "easing.h"



typedef NS_ENUM(NSInteger, EAxis) {
    E_X_Axis,   // X轴
    E_Y_Axis,   // Y轴
    E_Z_Axis    // Z轴
};

@interface JFJAnimationManager : NSObject

#pragma mark - 属性动画

/**
*  视图从小变大变化，从view的size的80%变为size的大小，并附带弹性效果
*
*  @param view     进行动画的view
*  @param duration 动画持续时间
*/
+ (void)animationSmallToBigView:(UIView *)view duration:(NSTimeInterval)duration;

/**
 *  绕中心自转， 默认旋转360°
 *
 *  @param view     进行动画的view
 *  @param duration 动画持续时间
 */
+ (void)animationCenterRotateView:(UIView *)view duration:(NSTimeInterval)duration;

/**
 *  绕锚点自转， 默认旋转360°
 *
 *  @param view          进行动画的view
 *  @param anchor        锚点
 *  @param duration      动画持续时间
 */
+ (void)animationAnchorPointRotateView:(UIView *)view anchorPiont:(CGPoint)anchor duration:(NSTimeInterval)duration;

/**
 *  抖动动画
 *
 *  @param view   进行动画的view
 *  @param repeat 是否重复
 */
+ (void)animationShakeView:(UIView *)view repeat:(BOOL)repeat;

/**
 *  翻转动画
 *
 *  @param view     进行动画的view
 *  @param axis     翻转中心轴
 *  @param repeat   是否重复
 *  @param duration 动画持续时间
 */
+ (void)animationFlipView:(UIView *)view axis:(EAxis)axis repeat:(BOOL)repeat duration:(NSTimeInterval)duration;

/**
 *  移动动画，可根据自己的需要选择缓动函数
 *
 *  @param view     进行动画的view
 *  @param endPoint 终点位置
 *  @param duration 动画持续时间
 *  @param func     使用的缓动函数，默认CubicEaseOut,需要弹性时建议设置为 ElasticEaseOut
 */
+ (void)animationPositionView:(UIView *)view toPoint:(CGPoint)endPoint duration:(NSTimeInterval)duration function:(AHEasingFunction)func;

/**
 *  iOS9 弹簧效果
 *
 *  @param view            进行动画的view
 *  @param keyPath         动画属性
 *  @param fromValue       初始值
 *  @param toValue         结束值
 *  @param damping         阻尼系数
 *  @param stiffness       劲度系数
 *  @param mass            质量
 *  @param initialVelocity 初始速度（可以设置负值，会先反向运动）
 */
+ (void)springAnimation:(UIView *)view keyPath:(NSString *)keyPath fromValue:(NSValue *)fromValue toValue:(NSValue *)toValue damping:(CGFloat)damping stiffness:(CGFloat)stiffness mass:(CGFloat)mass initialVelocity:(CGFloat)initialVelocity;





#pragma mark - 停止动画
/**
 *  移除动画
 *
 *  @param view         需要移除动画的view
 *  @param delayTime    延迟时间
 */
+ (void)stopAnimation:(UIView *)view delay:(NSTimeInterval)delayTime;

@end
