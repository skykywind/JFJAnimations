//
//  RainView.m
//  UseEmitterLayer
//
//  Created by AtronJia on 16/6/12.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "RainView.h"

@implementation RainView

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
    self.emitterlayer.emitterShape = kCAEmitterLayerLine;
    self.emitterlayer.emitterMode = kCAEmitterLayerVolume;
    self.emitterlayer.emitterSize= self.frame.size;
    self.emitterlayer.emitterPosition = CGPointMake(self.bounds.size.width / 2.0f, -20);

}

- (void)showWithEdge:(BOOL)edge {
    
    // 设置粒子
    CAEmitterCell *rainFlake = [CAEmitterCell emitterCell];
    rainFlake.birthRate = 25.f;
    rainFlake.speed = 10.f;
    rainFlake.velocity = 10.f;
    rainFlake.velocityRange = 10.f;
    rainFlake.yAcceleration = 1000.f;
    
    rainFlake.contents = (__bridge id)[UIImage imageNamed:@"rain"].CGImage;
    rainFlake.color = [UIColor whiteColor].CGColor;
    rainFlake.lifetime = 7.f;
    rainFlake.scale = 0.2f;
    rainFlake.scaleRange = 0.f;
    
    self.emitterlayer.emitterCells = @[rainFlake];
    
    // 设置边缘
    if (edge && self.maskView == nil) {
        UIImageView *mask = [[UIImageView alloc] initWithFrame:self.bounds];
        mask.image = [UIImage imageNamed:@"alpha"];
        self.maskView = mask;
    }
}


@end
