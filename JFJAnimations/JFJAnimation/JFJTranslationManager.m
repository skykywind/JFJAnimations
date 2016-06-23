//
//  JFJTranslationManager.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/21.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "JFJTranslationManager.h"

#import "UIImage+ImageEffects.h"  // 模糊图片的第三方框架

@implementation JFJTranslationManager

+ (void)transitionSystem:(UIView *)view transType:(NSString *)transType direction:(NSInteger)direction duration:(NSTimeInterval)duration operations:(Operations)operations {
    
    CATransition *transition=[[CATransition alloc]init];
    
    //设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
    transition.type = transType;
    
    BOOL bl = YES;
    
    if (direction == 1) {
        transition.subtype = kCATransitionFromLeft;
        bl = YES;
    }else if (direction == 2) {
        transition.subtype = kCATransitionFromRight;
        bl = NO;
    }else if (direction == 3) {
        transition.subtype = kCATransitionFromTop;
        bl = YES;
    }else if (direction == 4){
        transition.subtype = kCATransitionFromBottom;
        bl = NO;
    }else {
        transition.subtype = kCATransitionFromLeft;
        bl = YES;

    }
    
    // 设置动画时常
    transition.duration = duration;
    
    // 进行view视图的操作
    operations();
    
    [view.layer addAnimation:transition forKey:nil];
    
}
// CircleMask 默认中心开始动画
+ (void)transitionCircleMask:(UIView *)view anchor:(CGPoint)anchor showType:(EShowType)showType operations:(Operations)operations{
    
    CGFloat width = view.frame.size.width;
    CGFloat height = view.frame.size.height;
    CGFloat x = width / 2;
    CGFloat y = height / 2;
    
    x = anchor.x > 0.5 ? (2 * x * anchor.x) : (2 * x *(1 - anchor.x));
    y = anchor.y > 0.5 ? (2 * y * anchor.y) : (2 * y *(1 - anchor.y));
    
    CGFloat radius = sqrt(x*x + y*y);
    
    CGRect starRect = CGRectInset(CGRectMake(width * anchor.x, height * anchor.y, 0, 0), showType== E_Appear ? 0 : -radius, showType == E_Appear? 0 : -radius);
    CGRect endRect = CGRectInset(CGRectMake(width * anchor.x, height * anchor.y, 0, 0), showType == E_Appear ? -radius : 0, showType == E_Appear ? -radius : 0);
    CGPathRef startCirclePath = CGPathCreateWithEllipseInRect(starRect, NULL);
    CGPathRef endCirclePath = CGPathCreateWithEllipseInRect(endRect, NULL);

    // 初始化Shapelayer
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.frame = view.layer.bounds;
    shape.path = endCirclePath;
    //shape.anchorPoint = anchor;
    shape.fillRule = kCAFillRuleEvenOdd;
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    animation.fromValue = (__bridge id _Nullable)(startCirclePath);
    animation.toValue = (__bridge id _Nullable)(endCirclePath);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.duration = 0.5f;
    [shape addAnimation:animation forKey:nil];
    
    if (view.layer.mask) {
        view.layer.mask = nil;
    }
    view.layer.mask = shape;
    operations();
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animation.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        view.layer.mask = nil;
    });
}


// UIImageView淡入切换图片
+ (void)transitionFade:(UIImageView *)view newImage:(UIImage *)newImage {
    
    CALayer *layer = [CALayer layer];
    layer.frame = view.bounds;  //frame可以自定义
    layer.contents = (__bridge id _Nullable)(view.image.CGImage);
    
    if (view.layer.sublayers.count == 0) {
       [view.layer addSublayer:layer];
    } else {
        [view.layer replaceSublayer:view.layer.sublayers[0] with:layer];
    }
    
    // 添加动画
    CABasicAnimation *animation = [JFJTranslationManager animationkeyPath:@"contents" duration:1.f fromValue:layer.contents toValue:(__bridge id _Nullable)(newImage.CGImage)];
    view.image = newImage;
    [layer addAnimation:animation forKey:nil];
    
}

// UIImageView从模糊到清晰变化
+ (void)transitionBlur:(UIImageView *)view newImage:(UIImage *)newImage {
    
    [JFJTranslationManager transitionBlur:view image:newImage fromRadius:50 toRadius:0 duration:1.f];
    
}
// UIImageView模糊变化
+ (void)transitionBlur:(UIImageView *)view image:(UIImage *)image fromRadius:(CGFloat)fromRadius toRadius:(CGFloat)toRadius  duration:(NSTimeInterval)duration{
    
    CALayer *layer = [CALayer layer];
    layer.frame = view.bounds;  //frame可以自定义
    layer.contents = (__bridge id _Nullable)([image blurImageWithRadius:fromRadius].CGImage);
    
    if (view.layer.sublayers.count == 0) {
        [view.layer addSublayer:layer];
    } else {
        [view.layer replaceSublayer:view.layer.sublayers[0] with:layer];
    }
    
    // 添加动画
    CABasicAnimation *animation = [JFJTranslationManager animationkeyPath:@"contents" duration:duration fromValue:layer.contents toValue:(__bridge id _Nullable)([image blurImageWithRadius:toRadius].CGImage)];
    view.image = image;
    [layer addAnimation:animation forKey:nil];

}

// 设置显式动画
+ (CABasicAnimation *)animationkeyPath:(NSString *)keyPath duration:(NSTimeInterval)duration fromValue:(NSValue *)fromValue toValue:(NSValue *)toValue {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.duration = duration;
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

/*
// 将view转化成UIImage
- (UIImage *)convertViewToImage:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [view.layer renderInContext:context];
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}
*/









@end
