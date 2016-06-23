//
//  EffectViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/22.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "EffectViewController.h"
#import "JFJEffectManager.h"
@implementation EffectViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 155, 235)];
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"火影01"]];
    imageView.center = self.view.center;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
  //  [JFJEffectManager effectView:imageView frame:CGRectMake(20, 20, 110, 195)];
    
  // 印刻UILabel的效果
    UILabel *label = [[UILabel alloc] init];
    label.text = @"毛玻璃上的文字";
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    [JFJEffectManager effectView:imageView frame:CGRectMake(5, 40, 145, 40) withSubView:label subFrame:CGRectMake(0, 0, 145, 40)];

/*  // 印刻UIImageView的效果
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 115, 195)];
    imageView2.image = [UIImage imageNamed:[NSString stringWithFormat:@"火影03"]];
    [JFJEffectManager effectView:imageView frame:imageView.bounds withSubView:imageView2 subFrame:imageView2.frame];
*/
    
}



@end
