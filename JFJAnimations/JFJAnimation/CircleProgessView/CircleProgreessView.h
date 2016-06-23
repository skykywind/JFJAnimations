//
//  CircleProgreessView.h
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIView

@property (nonatomic, assign)CGFloat lineWidth;     // 进度条宽度 (0~1)
@property (nonatomic, strong)UIColor *lineColor;    // 进度条颜色
@property (nonatomic, strong)UIColor *backColor;    // 进度条背景色
@property (nonatomic, assign)CGFloat progress;      // 进度值

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lineCorlor:(UIColor *)lineColor backColor:(UIColor *)backColor;

@end
