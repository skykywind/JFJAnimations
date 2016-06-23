//
//  CircleTransController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/21.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "CircleTransController.h"
#import "JFJTranslationManager.h"
@interface CircleTransController (){
    UIImageView *back;
    NSInteger count;
}


@end
@implementation CircleTransController
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    count = 1;
    
    back = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 155, 235)];
    back.image = [UIImage imageNamed:[NSString stringWithFormat:@"火影05"]];
    back.center = self.view.center;
    [self.view addSubview:back];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 155, 235)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"火影0%lu", count]];
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [imageView addGestureRecognizer:tap];
    
}

- (void)tap:(UITapGestureRecognizer *)tap {

    count ++;
    if (count >5) {
        count = 1;
    }
    back.image = [UIImage imageNamed:[NSString stringWithFormat:@"火影0%lu",count == 1? 5 : count-1]];
    
    UIImage *newImage = [UIImage imageNamed:[NSString stringWithFormat:@"火影0%lu", count]];
    UIImageView *view = (UIImageView *)tap.view;
    
    [JFJTranslationManager transitionCircleMask:view anchor:CGPointMake(0, 0) showType:E_Appear operations:^{
        view.image = newImage;
    }];
    
}
@end
