//
//  CircleProgreessView.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "CircleProgreessView.h"

@interface CircleProgressView ()

@property (nonatomic, strong)CAShapeLayer *shapelayer;
@property (nonatomic, strong)CAShapeLayer *backLayer;

@end

@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLayer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lineCorlor:(UIColor *)lineColor backColor:(UIColor *)backColor{

    self = [super initWithFrame:frame];
    if (self) {
        [self createLayer];
        self.lineWidth = lineWidth;
        self.lineColor = lineColor;
        self.backColor = backColor;
    }
    return self;
}

- (void)createLayer {

    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
    _backLayer = [CAShapeLayer layer];
    _backLayer.frame = self.bounds;
    _backLayer.path = path.CGPath;
    _backLayer.fillColor = [UIColor clearColor].CGColor;
    _backLayer.lineWidth = 1.f;
    _backLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    _backLayer.strokeEnd = 1.f;
    [self.layer addSublayer:_backLayer];

    
    _shapelayer = [CAShapeLayer layer];
    _shapelayer.frame = self.bounds;
    _shapelayer.path = path.CGPath;
    _shapelayer.fillColor = [UIColor clearColor].CGColor;
    _shapelayer.lineWidth = 1.f;
    _shapelayer.strokeColor = [UIColor redColor].CGColor;
    _shapelayer.strokeEnd = 0.f;
    [self.layer addSublayer:_shapelayer];
}


// 重写 setter 和 getter 方法
@synthesize progress = _progress;

- (void)setProgress:(CGFloat)progress {

    _progress = progress;
    _shapelayer.strokeEnd = _progress;
    
}
- (CGFloat)progress {
    return _progress;
}

@synthesize lineWidth = _lineWidth;
- (void)setLineWidth:(CGFloat)lineWidth {
    
    _lineWidth = lineWidth;
    _shapelayer.lineWidth = _lineWidth;
    _backLayer.lineWidth = _lineWidth;
}
- (CGFloat)lineWidth {
    return _lineWidth;
}

@synthesize lineColor = _lineColor;
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    _shapelayer.strokeColor = _lineColor.CGColor;
}
- (UIColor *)lineColor {
   return  _lineColor;
}

@synthesize backColor = _backColor;
- (void)setBackColor:(UIColor *)backColor {
    _backColor = backColor;
    _backLayer.strokeColor = _backColor.CGColor;
}
- (UIColor *)backColor {
    return  _backColor;
}



@end
