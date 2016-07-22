//
//  PageLayoutController.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/27.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "PageLayoutController.h"
#import "PageCollectionLayout.h"
#import "MyCollectionCell.h"
#import <objc/runtime.h>

@interface PageLayoutController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate, UIScrollViewDelegate>
{
    UICollectionView *collection;
    int  currentIndex;
    CGSize itemSize;
}

@property (nonatomic, strong)NSMutableArray *cellsStateArr;
@end

@implementation PageLayoutController

- (NSMutableArray *)cellsStateArr {
    if (!_cellsStateArr) {
        _cellsStateArr = [NSMutableArray arrayWithObjects:@(NO), @(NO),@(NO), @(NO), @(NO), nil];
    }
    
    return _cellsStateArr;
}

- (void)viewDidLoad {

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UICollectionViewFlowLayout *layout = [[PageCollectionLayout alloc] init];
    itemSize = CGSizeMake(250, 400);
    layout.itemSize = itemSize;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout: layout];
    collection.backgroundColor = [UIColor clearColor];
    [self.view addSubview:collection];
    collection.delegate = self;
    collection.dataSource = self;
    collection.pagingEnabled = NO;
    
    // 设置减速的速率很重要
    collection.decelerationRate = UIScrollViewDecelerationRateFast;
    
    [collection registerClass:[MyCollectionCell class] forCellWithReuseIdentifier:@"MyCollectionCell"];
    
    
    // 添加手势操作cell
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [collection addGestureRecognizer:swipeUp];
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [collection addGestureRecognizer:swipeDown];
    
}


- (void)swipe:(UISwipeGestureRecognizer *)swipe {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:currentIndex inSection:0];
    MyCollectionCell *cell = (MyCollectionCell *)[collection cellForItemAtIndexPath:indexPath];
    if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        if (cell.isOpen == NO) {
            [cell open];
            cell.isOpen = YES;
        } else {
            // 完全展开到新的controller
            
            
            
        }
        
    } else if(swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        if(cell.isOpen == YES){
            [cell close];
            cell.isOpen = NO;
        } else {
            // 已经处于关闭状态不用操作
        }
    }
    
    [self.cellsStateArr replaceObjectAtIndex:currentIndex withObject:@(cell.isOpen)];
}

// 解决手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

#pragma mark - UISCrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat startOffset = (collection.bounds.size.width - itemSize.width) / 2;
    currentIndex = (collection.contentOffset.x + startOffset)/(itemSize.width + 25);
    
}

#pragma mark - CollectionViewDelegate And DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    MyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionCell" forIndexPath:indexPath];
    
//    if (cell == nil) {
//        cell = [[MyCollectionCell alloc] init];
//    }
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@",_cellsStateArr);
    if ([_cellsStateArr[indexPath.row] boolValue] == YES) {
        // 如果是打开状态要打开cell
        
        [(MyCollectionCell *)cell open];
    }
}








@end
