//
//  JFJTranslationManager.h
//  JFJAnimations
//
//  Created by AtronJia on 16/6/21.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, EShowType) {
    E_Appear,     // 出现
    E_Disappear   // 消失
};

typedef void(^Operations)();

@interface JFJTranslationManager : NSObject


/**
 *  视图内容变化时做系统转场动画
 *
 *  @param view         动画的view
 *  @param transType    动画方式：kCATransitionFade淡出/kCATransitionMoveIn移入/kCATransitionPush推入/kCATransitionReveal隐入/@"cube"立方体翻转/@"oglFlip"层翻转/@"cameraIrisHollowClose"相机关闭效果/@"cameraIrisHollowOpen"相机打开效果/@"pageCurl"翻页/@"pageUnCurl"回翻页/@"suckEffect"抽纸效果/@"rippleEffect"波纹
 *
 *  @param direction    动画方向：1:fromLeft, 2:fromRight, 3:fromTop, 4:fromBottom
 *  @param duration     动画时长
 *  @param operations   改变视图的操作
 */
+ (void)transitionSystem:(UIView *)view transType:(NSString *)transType direction:(NSInteger)direction duration:(NSTimeInterval)duration operations:(Operations)operations;

/**
 *  针对UIImageView 切换图片进行渐变动画
 *
 *  @param view     动画的imageview
 *  @param newImage 新图片
 */
+ (void)transitionFade:(UIImageView *)view newImage:(UIImage *)newImage;

/**
 *  针对UIImageView 切换图片进行模糊到清晰的动画
 *
 *  @param view     动画的imageview
 *  @param newImage 新图片
 */
+ (void)transitionBlur:(UIImageView *)view newImage:(UIImage *)newImage;

/**
 *  针对UIImageView 切换图片进行自定义模糊动画
 *
 *  @param view       动画的imageview
 *  @param newImage   动画时的image
 *  @param fromRadius 初始模糊程度
 *  @param toRadius   结束模糊程度
 *  @param duration   动画时长
 */
+ (void)transitionBlur:(UIImageView *)view image:(UIImage *)image fromRadius:(CGFloat)fromRadius toRadius:(CGFloat)toRadius  duration:(NSTimeInterval)duration;
/**
 *  圆形遮罩式切换视图
 *
 *  @param view       动画的view
 *  @param anchor     锚点，即动画中心点（相对于view的CGPoint，x、y取值都在 0~1之间，（0,0）为         左上角，（1,1）为右下角）
 *  @param showType   出现/消失
 *  @param operations 动画过程中的操作
 */
+ (void)transitionCircleMask:(UIView *)view anchor:(CGPoint)anchor showType:(EShowType)showType operations:(Operations)operations;
@end
