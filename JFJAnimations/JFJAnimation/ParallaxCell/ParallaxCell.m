//
//  ParallaxCell.m
//  PreviewDemo
//
//  Created by AtronJia on 16/6/28.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "ParallaxCell.h"

@implementation ParallaxCell

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addUI];
    }
    return self;
}

- (void)addUI {
    
    self.contentView.backgroundColor = [UIColor blackColor];
    self.contentMode = UIViewContentModeCenter;
    
    // 添加一个view作为图片的显示view
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 240)];
    view.layer.masksToBounds = YES;
    [self.contentView addSubview:view];
    
    // 设置一个ImageView的frame大于显示view的fframe
    self.parallaxImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, -40, ScreenWidth, 300)];
    self.parallaxImage.contentMode = UIViewContentModeScaleToFill;
    [view addSubview:self.parallaxImage];
    
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view {
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    CGFloat distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMidY(rectInSuperview);
    CGFloat difference = CGRectGetHeight(self.parallaxImage.frame) - CGRectGetHeight(self.frame);
  
    // 图片的高度应小于cell的高度，则无效
    CGFloat move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = self.parallaxImage.frame;
    imageRect.origin.y = - (difference / 2) + move;
    self.parallaxImage.frame = imageRect;
}







@end
