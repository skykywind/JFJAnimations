//
//  ViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/17.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "ViewController.h"
#import "JFJAnimationManager.h"
#import "SmallToBigViewController.h"
#import "UITableView+LoadAnimation.h"
#import "CenterRoutateViewController.h"
#import "AnchorRotaeViewController.h"
#import "DelayViewController.h"
#import "FlipViewConreoller.h"
#import "ShakeViewController.h"
#import "CircleTransController.h"
#import "ImageTransController.h"
#import "TransSystemController.h"
#import "EffectViewController.h"
#import "TransBlurController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UITableView *mainTable;
@property (nonatomic, strong) NSArray *controllers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _dataSource = [NSMutableArray arrayWithObjects:@"1, 大小弹性动画", @"2, 绕中心自转动画", @"3, 锚点自转动画", @"4, 移动衰减动画", @"5, 翻转动画", @"6, 抖动动画", @"7, 圆弧切换视图", @"8, 淡入切换图片", @"9, 系统切换视图动画", @"11, 模糊效果展示", @"12, 模糊切换图片", @"13, ",  @"14, ", @"15, ", nil];
    
    _controllers = @[[SmallToBigViewController class], [CenterRoutateViewController class],[AnchorRotaeViewController class], [DelayViewController class],[FlipViewConreoller class], [ShakeViewController class],[CircleTransController class], [ImageTransController class], [TransSystemController class], [EffectViewController class], [TransBlurController class]];
    
    _mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    
    _mainTable.delegate = self;
    _mainTable.dataSource = self;
    
    [self.view addSubview:_mainTable];
    
    // 带动画刷新table
    [_mainTable reloadDataWithAnimate:LiftUpFromBottum];
    
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *iden = @"iden";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [[self.controllers[indexPath.row] alloc] init];
    
    [self.navigationController pushViewController:controller animated:YES];
}


//  可以给cell做出场动画
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

//    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 0.1);
//    
//    //设置动画时间为0.25秒,xy方向缩放的最终值为1
//    [UIView animateWithDuration:0.25 animations:^{
//        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    }];
    [JFJAnimationManager animationSmallToBigView:cell duration:1.5];

}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    
    return _dataSource;
}

@end
