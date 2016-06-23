//
//  TransBlurController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/22.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "TransBlurController.h"
#import "JFJTranslationManager.h"
@interface TransBlurController (){
    
    NSInteger count;
}

@end

@implementation TransBlurController
- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    count = 1;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 155, 235)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"火影0%lu", count]];
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [imageView addGestureRecognizer:tap];
    
}

- (void)tap:(UITapGestureRecognizer *)tap {
    NSLog(@"%lu", count);
    count ++;
    if (count >5) {
        count = 1;
    }
    
    UIImage *newImage = [UIImage imageNamed:[NSString stringWithFormat:@"火影0%lu", count]];
    UIImageView *view = (UIImageView *)tap.view;
    
  //  [JFJTranslationManager transitionBlur:view newImage:newImage];
    
    // 先从清洗到模糊再到清晰
    
    [JFJTranslationManager transitionBlur:view image:view.image fromRadius:0 toRadius:50 duration:1.0];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [JFJTranslationManager transitionBlur:view image:newImage fromRadius:50 toRadius:0 duration:1.0];
    });
}
@end
