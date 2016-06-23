//
//  UITableView+LoadAnimation.m
//  TableView动画
//
//  Created by AtronJia on 16/3/16.
//  Copyright © 2016年 Arton. All rights reserved.
//

#import "UITableView+LoadAnimation.h"

@implementation UITableView (LoadAnimation)


- (void)reloadDataWithAnimate:(AnimationDirect)direct {
    
    [self reloadDataWithAnimate:direct animationTime:0.2 interval:0.3];
}

/**
 *  UITableView重新加载动画
 *
 *  @param   direct    cell运动方向
 *  @param   time      动画持续时间，
 *  @param   interval  每个cell间隔
 */
- (void)reloadDataWithAnimate:(AnimationDirect)direct animationTime:(NSTimeInterval)animationTime interval:(NSTimeInterval)interval {
    
    [self setContentOffset:self.contentOffset animated:NO];
    [UIView animateWithDuration:0.2 animations:^{
        self.hidden = YES;
        [self reloadData];
    } completion:^(BOOL finished) {
        self.hidden = NO;
        [self visibleRowsBeginAnimation:direct animationTime:animationTime interval:interval];
    }];
}

- (void)visibleRowsBeginAnimation:(AnimationDirect)direct animationTime:(NSTimeInterval)animationTime interval:(NSTimeInterval)interval {
    NSArray *visibleArray = self.indexPathsForVisibleRows;
    
    NSUInteger count = visibleArray.count;
    switch (direct) {
            //从上到下
        case DropDownFromTop:
            for (int i = 0; i<count; i++) {
                NSIndexPath *indexPath = visibleArray[count -1 - i];
                UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
                cell.hidden = YES;
                CGPoint originPoint = cell.center;
                //将cell移到screen上方
                cell.center = CGPointMake(originPoint.x, originPoint.y-1000);
                //开始cell动画
                [UIView animateWithDuration:animationTime + i* interval delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                    
                    cell.center = CGPointMake(originPoint.x, originPoint.y +2.0);
                    cell.hidden = NO;
                    
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                        cell.center = CGPointMake(originPoint.x, originPoint.y- 2.0);
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                            cell.center = originPoint;
                        } completion:^(BOOL finished) {
                            
                        }];
                    }];
                }];
            }
            break;
            
            //从下到上
        case LiftUpFromBottum:
            for (int i = 0; i<count; i++) {
                NSIndexPath *indexPath = visibleArray[i];
                UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
                cell.hidden = YES;
                CGPoint originPoint = cell.center;
                cell.center = CGPointMake(originPoint.x, originPoint.y +1000);
                [UIView animateWithDuration:animationTime +i*interval delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    cell.center = CGPointMake(originPoint.x, originPoint.y-2.0);
                    cell.hidden = NO;
                } completion:^(BOOL finished) {
                   [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                       cell.center = CGPointMake(originPoint.x, originPoint.y +2.0);
                   } completion:^(BOOL finished) {
                      [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                          cell.center= originPoint;
                      } completion:^(BOOL finished) {
                          
                      }];
                   }];
                }];
            }
            break;
        case FromLeftToRight:
            for (int i = 0; i<count; i++) {
                NSIndexPath *indexPath = visibleArray[i];
                UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
                cell.hidden = YES;
                CGPoint originPoint = cell.center;
                cell.center = CGPointMake(-cell.frame.size.width, originPoint.y);
                [UIView animateWithDuration:animationTime + i *interval delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    cell.center = CGPointMake(originPoint.x-2.0, originPoint.y);
                    cell.hidden = NO;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                        cell.center = CGPointMake(originPoint.x +2.0, originPoint.y);
                    } completion:^(BOOL finished) {
                        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                            cell.center = originPoint;
                        } completion:nil];
                    }];
                }];
            }
            
            break;
        case FromRightToLeft:
            for (int i = 0; i<count; i++) {
                NSIndexPath *indexPath = visibleArray[i];
                UITableViewCell *cell = [self cellForRowAtIndexPath:indexPath];
                CGPoint originPoint = cell.center;
                cell.hidden = YES;
                cell.center = CGPointMake(cell.frame.size.width *3, originPoint.y);
                [UIView animateWithDuration:animationTime + i*interval delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                    cell.hidden = NO;
                    cell.center = CGPointMake(originPoint.x +2.0, originPoint.y);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                        cell.center = CGPointMake(originPoint.y-2.0, originPoint.y);
                    } completion:^(BOOL finished) {
                       [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                           cell.center = originPoint;
                       } completion:^(BOOL finished) {
                           
                       }];
                    }];
                }];
            }
            
            break;
            
            
        default:
            break;
    }
    
}
































@end
