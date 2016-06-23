//
//  JFJAnimationController.h
//  JFJAnimations
//
//  Created by AtronJia on 16/6/20.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,EAnimationType){
   
    EAnimationTypeNone,
    EAnimationTypeFlip,
    EAnimationTypeFade,
    EAnimationTypeFold,

};

@interface JFJAnimationController : NSObject <UIViewControllerAnimatedTransitioning>

// 记录 push 或 pop
@property (nonatomic)UINavigationControllerOperation operation;

@property (nonatomic)EAnimationType type;

@end
