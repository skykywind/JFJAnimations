//
//  PageCollectionLayout.m
//  JFJAnimations
//
//  Created by AtronJia on 16/6/24.
//  Copyright © 2016年 Artron. All rights reserved.
//

#import "PageCollectionLayout.h"

@interface PageCollectionLayout ()

@property (nonatomic, assign) CGSize  lastCollectionViewSize;
@property (nonatomic, assign) CGFloat scalingOffset;
@property (nonatomic, assign) CGFloat minimumScaleFactor;
@property (nonatomic, assign) CGFloat minimumAlphaFactor;
@property (nonatomic, assign) BOOL    scaleItems;
@end

@implementation PageCollectionLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self commonInit];
    }
    return self;
}

#pragma mark - 设置默认值
- (void)commonInit {
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 25;
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    _lastCollectionViewSize = CGSizeZero;
    _scalingOffset = 200;
    _minimumScaleFactor = 0.9;
    _minimumAlphaFactor = 0.3;
    _scaleItems = YES;
}

#pragma mark - 重写内部方法
- (void)invalidateLayoutWithContext:(UICollectionViewLayoutInvalidationContext *)context {

    [super invalidateLayoutWithContext:context];
    
    if (![[NSValue valueWithCGSize:self.collectionView.bounds.size] isEqualToValue:[NSValue valueWithCGSize:_lastCollectionViewSize]]) {
        
        [self configureInset];
        _lastCollectionViewSize = self.collectionView.bounds.size;
        
    }
}

// 重新设置偏移量
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    // 获取当前显示rect
    CGRect proposeRect = CGRectMake(proposedContentOffset.x, 0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
    NSArray *layoutAttributes = [self layoutAttributesForElementsInRect:proposeRect];
    
    UICollectionViewLayoutAttributes *candidateAttributes;
    
    // 找到目标内容的移动距离
    CGFloat centerX = proposedContentOffset.x + self.collectionView.bounds.size.width / 2;
    
    for (UICollectionViewLayoutAttributes *attributes in layoutAttributes) {
        
        if (attributes.representedElementCategory !=     UICollectionElementCategoryCell) {
            continue;
        }
        
        if (candidateAttributes == nil) {
            candidateAttributes = attributes;
            continue;
        }
        // 确定中心点哪个更近，取更接近中心的 attributes
        if (fabs(attributes.center.x - centerX) < fabs(candidateAttributes.center.x - centerX)) {
            candidateAttributes = attributes;
        }
    }
    
    CGFloat newOffsetX = candidateAttributes.center.x - self.collectionView.bounds.size.width / 2;
    CGFloat offset = newOffsetX - self.collectionView.contentOffset.x;
    
    
    // 根据移动方向及之前的偏移量来重新设置偏移值
    if ((velocity.x < 0 && offset > 0) || (velocity.x > 0 && offset < 0)) {
        CGFloat pageWidth = self.itemSize.width + self.minimumLineSpacing;
        newOffsetX += velocity.x > 0 ? pageWidth : -pageWidth;

    }
    
    return CGPointMake(newOffsetX, proposedContentOffset.y);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSArray *superAttributes = [super layoutAttributesForElementsInRect:rect];
    
    if (_scaleItems == NO) {
        return  [super layoutAttributesForElementsInRect:rect];
    }
    
    CGPoint contentOffset = self.collectionView.contentOffset;
    CGSize size = self.collectionView.bounds.size;
    CGRect visibleRect = CGRectMake(contentOffset.x, contentOffset.y, size.width, size.height);
    CGFloat visibleCenterX = CGRectGetMidX(visibleRect);
    
    NSArray *newAttributesArray = [[NSArray alloc] initWithArray:superAttributes copyItems:YES];
    
    for(UICollectionViewLayoutAttributes *attributes in newAttributesArray) {
        CGFloat distanceFromCenter = visibleCenterX - attributes.center.x;
        CGFloat absDistanceFromCenter = MIN(ABS(distanceFromCenter), self.scalingOffset);
        CGFloat scale = absDistanceFromCenter * (self.minimumScaleFactor - 1) / self.scalingOffset + 1;
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1);
        attributes.alpha = absDistanceFromCenter * (self.minimumAlphaFactor - 1) / self.scalingOffset + 1;
        
    }
    
    return newAttributesArray;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
    
}

// 初始化内部布局
- (void)configureInset {
    
    CGFloat inset = self.collectionView.bounds.size.width / 2 - self.itemSize.width / 2;
    self.collectionView.contentInset = UIEdgeInsetsMake(0, inset, 0, inset);
    self.collectionView.contentOffset = CGPointMake(- inset, 0);
    
}



@end






















