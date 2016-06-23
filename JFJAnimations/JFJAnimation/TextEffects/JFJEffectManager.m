//
//  JFJEffectManager.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/22.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "JFJEffectManager.h"

@implementation JFJEffectManager


// 普通模糊
+ (UIVisualEffectView *)effectView:(UIView *)view frame:(CGRect)frame{
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    effectView.frame = frame;

    [view addSubview:effectView];
    
    return effectView;
}

// 模糊view，并添加子View印刻在模糊层中
+ (UIVisualEffectView *)effectView:(UIView *)view frame:(CGRect)frame withSubView:(UIView *)subView subFrame:(CGRect)subFrame {
    
    UIVisualEffectView *effectView = [JFJEffectManager effectView:view frame:frame];
    
    // 子模糊view
    UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect *)effectView.effect]];
    subEffectView.frame = subFrame;
    subView.frame = subEffectView.bounds; //这里会更改view的位置
    
    [effectView.contentView addSubview:subEffectView];
    [subEffectView.contentView addSubview:subView];
    
    return effectView;
}

@end
