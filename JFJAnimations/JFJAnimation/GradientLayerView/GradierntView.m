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
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = self.bounds;
        self.gradientLayer.colors = @[
                                      (__bridge id)[UIColor clearColor].CGColor,
                                      (__bridge id)[UIColor redColor].CGColor,
                                      (__bridge id)[UIColor clearColor].CGColor
                                      ];
        self.gradientLayer.locations = @[@(-1), @(-0.5), @(0)];
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



- (void)animate:(NSTimeInterval)duration{
   
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
        animation.fromValue = self.gradientLayer.locations;
        animation.toValue = @[@(1),@(1.5), @(2)];
        animation.duration = duration;
        [self.gradientLayer addAnimation:animation forKey:nil];

}
@end
