//
//  SnowView.m
//  UseEmitterLayer
//
//  Created by AtronJia on 16/6/12.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "SnowView.h"

@implementation SnowView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initEmitterLayerProperty];
    }
    return self;
}

- (void)initEmitterLayerProperty {

    self.emitterlayer.masksToBounds = YES;
    self.emitterlayer.emitterShape = kCAEmitterLayerLine;   //发射器形状
    self.emitterlayer.emitterMode = kCAEmitterLayerSurface; //发射方式
    self.emitterlayer.emitterSize= self.frame.size;
    self.emitterlayer.emitterPosition = CGPointMake(self.bounds.size.width / 2.0f, -20);                                 //发射中心点
}

- (void)showWithEdge:(BOOL)edge {
    
    //粒子属性的设置
    CAEmitterCell *snowFlake = [CAEmitterCell emitterCell];
    snowFlake.birthRate = 1.0f;
    snowFlake.speed = 10.f;
    snowFlake.velocity = 2.f;
    snowFlake.velocityRange = 10.f;
    snowFlake.yAcceleration = 10.f;
    snowFlake.emissionRange = 0.5 * M_PI;
    
    //旋转
    snowFlake.spinRange = 0.25 * M_PI;
    snowFlake.contents = (__bridge id)[UIImage imageNamed:@"snow"].CGImage;
    snowFlake.color = [UIColor lightGrayColor].CGColor;
    snowFlake.lifetime = 120.f;
    snowFlake.scale = 1.0f;
    snowFlake.scaleRange = 0.3f;
    
    self.emitterlayer.emitterCells = @[snowFlake];
    
    // 虚化边缘
    if (edge && self.maskView == nil) {
        UIImageView *mask = [[UIImageView alloc] initWithFrame:self.bounds];
        mask.image = [UIImage imageNamed:@"alpha"];
        self.maskView = mask;
    }
    
}













@end
