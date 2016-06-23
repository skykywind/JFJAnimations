//
//  JFJEffectManager.h
//  JFJAnimations
//
//  Created by AtronJia on 16/6/22.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface JFJEffectManager : NSObject


+ (UIVisualEffectView *)effectView:(UIView *)view frame:(CGRect)frame;

+ (UIVisualEffectView *)effectView:(UIView *)view frame:(CGRect)frame withSubView:(UIView *)subView subFrame:(CGRect)subFrame;

@end
