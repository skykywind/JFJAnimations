//
//  ParallaxCell.h
//  PreviewDemo
//
//  Created by AtronJia on 16/6/28.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ParallaxCell : UITableViewCell

@property (strong, nonatomic) UIImageView *parallaxImage;


- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;


@end
