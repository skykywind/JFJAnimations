//
//  EmitterLayerView.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "EmitterLayerView.h"

@interface EmitterLayerView ()

@property (nonatomic, strong)CAEmitterLayer *emitterLayer;
@end

@implementation EmitterLayerView


// 替换view的layer
+ (Class)layerClass {
    
    return [CAEmitterLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _emitterLayer = (CAEmitterLayer *)self.layer;
        
    }
    
    return self;
}



- (void)showWithEdge:(BOOL)edge {

}

- (void)hide {

}

- (void)setEmitterLayer:(CAEmitterLayer *)emitterlayer {
    _emitterLayer = emitterlayer;
}
- (CAEmitterLayer *)emitterlayer {
    
    return _emitterLayer;
}

@end
