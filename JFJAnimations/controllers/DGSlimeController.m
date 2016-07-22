//
//  DGSlimeController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/29.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "DGSlimeController.h"
#import "DGSlimeView.h"
@interface DGSlimeController ()

@end

@implementation DGSlimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    DGSlimeView *view = [[DGSlimeView alloc] initWithFrame:self.view.bounds];
    view.center = self.view.center;
    [self.view addSubview:view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
