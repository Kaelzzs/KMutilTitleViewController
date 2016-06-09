//
//  KCollectionViewLayout.m
//  CollectionViewDemo
//
//  Created by Kael on 16/6/6.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "KCollectionViewLayout.h"

#define SCREEN_WIDTH 320
#define ITEM_SIZE 30

@interface KCollectionViewLayout (){

        CGSize _cvSize;
        CGPoint _cvCenter;
        CGFloat _radius;
        NSInteger _cellCount;
        
}

@end

@implementation KCollectionViewLayout

//-(id)init
//{
//    self = [super init];
//    if (self) {
//        self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
//        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        self.sectionInset = UIEdgeInsetsMake(200, 0.0, 200, 0.0);
//        self.minimumLineSpacing = 50.0;
//    }
//    return self;
//}


//- (void)prepareLayout
//{
//    [super prepareLayout];
//    
////    [self registerClass:[MyCollectionReusableView class] forDecorationViewOfKind:@"MyDecoration"];
//    
////    _cvSize = self.collectionView.frame.size;
////    _cellCount = [self.collectionView numberOfItemsInSection:0];
////    _cvCenter = CGPointMake(_cvSize.width / 2.0, _cvSize.height / 2.0);
////    _radius = MIN(_cvSize.width, _cvSize.height) / 2.5;
//}


//-(CGSize)collectionViewContentSize
//{
//    return self.collectionView.bounds.size;
//}//返回contentsize的总大小
//
////自定义布局必须YES
//
//-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
//{
//    
//    return YES;
//    
//}
//
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path{
//    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
//    
//    attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
////    NSLog(@"行数%ld",path.row);
//    attributes.center = CGPointMake(10+ITEM_SIZE/2+(ITEM_SIZE/2+ITEM_SIZE)*(path.row%9),5+ITEM_SIZE/2+(path.row/9)*ITEM_SIZE*1.5);
////    attributes.center = CGPointMake(_cvCenter.x + _radius * cosf(2 * path.item * M_PI / _cellCount), _cvCenter.y + _radius * sinf(2 * path.item * M_PI / _cellCount));
//    return attributes;
//}//返回每个cell的布局属性
//
//
//-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
//{
//    
//    NSArray *array = [super layoutAttributesForElementsInRect:rect];
//    
//    NSMutableArray* attributes = [NSMutableArray array];
//    
//    for (NSInteger i=0 ; i < [array count]; i++) {
//        
//        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//        
//        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
//        
//    }
//    
//    return attributes;
//    
//}//返回所有cell的布局属性
@end
