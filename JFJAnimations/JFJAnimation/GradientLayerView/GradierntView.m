//
//  GradierntView.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "GradierntView.h"

@interface GradierntView ()

@property (nonatomic, strong)CAGradientLayer *gradientLayer;

@end

@implementation GradierntView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.layer.masksToBounds = YES;
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = CGRectMake(-self.bounds.size.width, 0, self.bounds.size.width *3, self.bounds.size.height) ;
        self.gradientLayer.colors = @[
                                      (__bridge id)[UIColor clearColor].CGColor,
                                      (__bridge id)[UIColor redColor].CGColor,
                                      (__bridge id)[UIColor clearColor].CGColor
                                      ];
        self.gradientLayer.locations = @[@(0.0), @(0.25), @(0.5)];
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(1, 0);
        [self.layer addSublayer:self.gradientLayer];
    }
    return self;
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.gradientLayer.colors = @[
                                  (__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)_color.CGColor,
                                  (__bridge id)[UIColor clearColor].CGColor
                                  ];
}
- (void)setDirection:(EColorDeriction)direction {

    switch (direction) {
        case UP:
        {
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(0, 1);
            break;
        }
        case DOWN:{
            self.gradientLayer.startPoint = CGPointMake(0, 1);
            self.gradientLayer.endPoint = CGPointMake(0, 0);
            break;
        }
        case LEFT:{
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(1, 0);
            break;
        }
        case RIGHT:{
            self.gradientLayer.startPoint = CGPointMake(1, 0);
            self.gradientLayer.endPoint = CGPointMake(0, 0);
            break;
        }
        case UPLEFT:{
            self.gradientLayer.startPoint = CGPointMake(0, 0);
            self.gradientLayer.endPoint = CGPointMake(1, 1);
            break;
        }
        default:
            break;
    }
    
}
//
//- (void)setText:(NSString *)text {
//    _text = text;
//    
//    if (self.gradientLayer.mask != nil) {
//        self.gradientLayer.mask = nil;
//    }
//    
//    
// //   CALayer *layer = [CALayer layer];
//    
//    
//}

- (void)animate:(NSTimeInterval)duration repeatCount:(CGFloat)repeatCount{
   
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.fromValue = self.gradientLayer.locations;
    animation.toValue = @[@(0.75),@(1), @(1)];
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    [self.gradientLayer addAnimation:animation forKey:nil];

}
@end
