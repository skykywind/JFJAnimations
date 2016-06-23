//
//  EmitterLayerView.h
//  JFJAnimations
//
//  Created by AtronJia on 16/6/23.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmitterLayerView : UIView


/**
 *  显示view
 */
- (void)showWithEdge:(BOOL)edge;

/**
 *  隐藏view
 */
- (void)hide;


// 模仿 setter 和 getter 方法方便获取layer来设置属性
- (void)setEmitterLayer:(CAEmitterLayer *)emitterlayer;
- (CAEmitterLayer *)emitterlayer;


@end
