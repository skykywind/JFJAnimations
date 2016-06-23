//
//  ImageTransController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/21.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "ImageTransController.h"
#import "JFJTranslationManager.h"
@interface ImageTransController (){
    
    NSInteger count;
}

@end
@implementation ImageTransController

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
    
    [JFJTranslationManager transitionFade:view newImage:newImage];
    
}


@end
