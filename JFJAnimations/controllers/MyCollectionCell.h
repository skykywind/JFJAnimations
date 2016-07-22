//
//  MyCollectionCell.h
//  JFJAnimations
//
//  Created by AtronJia on 16/6/27.
//  Copyright © 2016年 Artron. All rights reserved.
//  可以展开和关闭的cell

#import <UIKit/UIKit.h>

@interface MyCollectionCell : UICollectionViewCell

@property (nonatomic) BOOL isOpen;

- (void)open;
- (void)close;

@end
