//
//  ParallaxViewController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/28.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "ParallaxViewController.h"
#import "ParallaxCell.h"
@interface ParallaxViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)NSArray *tableItems;
@property (nonatomic, strong)UITableView *table;
@end

@implementation ParallaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableItems = @[[UIImage imageNamed:@"demo_1.jpg"],
                        [UIImage imageNamed:@"demo_2.jpg"],
                        [UIImage imageNamed:@"demo_3.jpg"],
                        [UIImage imageNamed:@"demo_4.png"],
                        [UIImage imageNamed:@"demo_1.jpg"],
                        [UIImage imageNamed:@"demo_2.jpg"],
                        [UIImage imageNamed:@"demo_3.jpg"],
                        [UIImage imageNamed:@"demo_4.png"],
                        [UIImage imageNamed:@"demo_3.jpg"],
                        [UIImage imageNamed:@"demo_2.jpg"],
                        [UIImage imageNamed:@"demo_1.jpg"],
                        [UIImage imageNamed:@"demo_4.png"]];
    _table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _table.delegate = self;
    _table.dataSource = self;
    
    [self.view addSubview:_table];
    
    [_table registerClass:[ParallaxCell class] forCellReuseIdentifier:@"ParallaxCell"];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:self.table];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ParallaxCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ParallaxCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ParallaxCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ParallaxCell"];
    }
    
    cell.parallaxImage.image = self.tableItems[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
    
}

// 移动时改变图片frame
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSArray *visibleCells = [self.table visibleCells];
    for (ParallaxCell *cell in visibleCells) {
        [cell cellOnTableView:self.table didScrollOnView:self.view];
    }
    
}
@end
