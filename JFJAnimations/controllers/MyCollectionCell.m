//
//  MyCollectionCell.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/27.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "MyCollectionCell.h"

@interface MyCollectionCell() {

    UIView *frontView;
    UIView *backView;
    
}

@end

#define deltaX 20
#define deltaY 30

@implementation MyCollectionCell

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
       self.backgroundColor = [UIColor redColor];
        
        [self initFrontView];
        [self initBackView];
        self.layer.cornerRadius = 5;


    }
    
    
    return self;
}

- (void)initFrontView {

    frontView = [[UIView alloc] initWithFrame:self.bounds];
    frontView.backgroundColor = [UIColor cyanColor];
    frontView.layer.masksToBounds = YES;
    frontView.layer.cornerRadius = 5.f;
    [self.contentView addSubview:frontView];
}

- (void)initBackView {
    backView = [[UIView alloc] initWithFrame:self.bounds];
    backView.backgroundColor = [UIColor yellowColor];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 5.f;
    if (frontView) {
        [self.contentView insertSubview:backView belowSubview:frontView];
    } else {
        [self.contentView addSubview:backView];
    }

}


- (void)open {
    [UIView animateWithDuration:0.3 animations:^{
        
        if (!self.isOpen) {
            self.isOpen = YES;
            CGPoint center = frontView.center;
            center.y -= deltaY;
            frontView.center = center;
            
            CGRect rect = backView.frame;
            CGRect newRect = CGRectMake(rect.origin.x - deltaX, rect.origin.y +deltaY, rect.size.width + deltaX * 2, rect.size.height);
            backView.frame = newRect;
            
        } else {
            
            // 变成controller全屏
            
        }

    }];
    
    
    
}
- (void)close {

    [UIView animateWithDuration:0.3 animations:^{
       
        if (self.isOpen) {
            self.isOpen = NO;
            CGPoint center = frontView.center;
            center.y += deltaY;
            frontView.center = center;
            
            CGRect rect = backView.frame;
            CGRect newRect = CGRectMake(rect.origin.x + deltaX, rect.origin.y - deltaY, rect.size.width - deltaX * 2, rect.size.height);
            backView.frame = newRect;
            
        } else {
            
            // 变成controller全屏
 
        }
        
    }];

}

- (void)prepareForReuse {
    self.isOpen = NO;
    frontView.frame = self.bounds;
    backView.frame = self.bounds;
}
@end
