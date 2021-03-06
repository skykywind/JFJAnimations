//
//  GradierntView.h
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum :NSUInteger {
    UP,
    DOWN,
    RIGHT,
    LEFT,
    UPLEFT,
} EColorDeriction;

@interface GradierntView : UIView

///**
// *  显示的文本
// */
//@property (nonatomic, strong) NSString *text;
//
///**
// *  显示的图片
// */
//@property (nonatomic, strong) UIImage *image;

/**
 *  确定方向
 */
@property (nonatomic, assign) EColorDeriction direction;

/**
 *  颜色
 */
@property (nonatomic, strong) UIColor *color;


/**
 *  开始动画
 *
 *  @param duration 动画时长
 */
- (void)animate:(NSTimeInterval)duration repeatCount:(CGFloat)repeatCount;

@end
