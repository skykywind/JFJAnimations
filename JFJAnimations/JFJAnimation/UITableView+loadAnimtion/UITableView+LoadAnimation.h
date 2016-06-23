//
//  UITableView+LoadAnimation.h
//  TableView动画
//
//  Created by AtronJia on 16/3/16.
//  Copyright © 2016年 Arton. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AnimationDirect) {
    DropDownFromTop,
    LiftUpFromBottum,
    FromRightToLeft,
    FromLeftToRight
};

@interface UITableView (LoadAnimation)


/**
 *  UITableView重新加载动画,刷新数据时调用
 *
 *  @param   direct    cell运动方向
 */
- (void)reloadDataWithAnimate:(AnimationDirect)direct;

/**
 *  UITableView重新加载动画,刷新数据时调用
 *
 *  @param   direct    cell运动方向
 *  @param   time      动画持续时间
 *  @param   interval  每个cell间隔
 */
- (void)reloadDataWithAnimate:(AnimationDirect)direct animationTime:(NSTimeInterval)animationTime interval:(NSTimeInterval)interval;

@end
