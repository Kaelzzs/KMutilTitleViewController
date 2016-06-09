//
//  KFlowLayout.m
//  CollectionViewDemo
//
//  Created by Kael on 16/6/7.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "KFlowLayout.h"

@implementation KFlowLayout
- (void)prepareLayout
{
    [super prepareLayout];
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    if (self.collectionView.bounds.size.height) {
        
        self.itemSize = self.collectionView.bounds.size;
    }
    
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}
@end
