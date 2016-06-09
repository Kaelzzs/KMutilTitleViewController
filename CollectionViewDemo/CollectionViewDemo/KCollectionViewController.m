//
//  KCollectionViewController.m
//  CollectionViewDemo
//
//  Created by Kael on 16/6/5.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "KCollectionViewController.h"

@interface KCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{


}
@property (strong, nonatomic) NSMutableArray *letterArray;
@end


// 注意const的位置
static NSString *const cellId = @"cellId";
static NSString *const headerId = @"headerId";
static NSString *const footerId = @"footerId";

@implementation KCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.letterArray = [NSMutableArray array];
    for(int i=0; i<26; i++)
    {
        [self.letterArray addObject:[NSString stringWithFormat:@"%C",(unichar)(65+i)]];
    }
    
    KCollectionViewLayout *layout = [[KCollectionViewLayout alloc] init];
    [layout prepareLayout];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor orangeColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerId];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerId];
    // Do any additional setup after loading the view.
}

#pragma mark - 代理方法
//section数目
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}
//section中的cellItem数目
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.letterArray.count;
}

//数据赋值 刷新区
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //这种事需要提前注册的吧
    UICollectionViewCell *cellItem = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
//    if (cellItem == nil) {
//        cellItem = [UICollectionViewCell alloc] initwith
//    }
    //这种注册方式不需要再外部提前注册
//    UICollectionViewCell *cellItem2 = [collectionView dequeueReusableSupplementaryViewOfKind:NSStringFromClass([UICollectionViewCell class]) withReuseIdentifier:cellId forIndexPath:indexPath];
    
    cellItem.backgroundColor = [UIColor purpleColor];
    for (UIView *labelView in [cellItem subviews]) {
        if ([labelView isKindOfClass:[UILabel class]]) {
            [labelView removeFromSuperview];
        }
    }
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [self.letterArray objectAtIndex:indexPath.row%26];
    label.textColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:12];
    [label sizeToFit];
    label.center = CGPointMake(cellItem.bounds.size.width/2, cellItem.bounds.size.height/2);
    [cellItem addSubview:label];

    return cellItem;
}
// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
        if(headerView == nil)
        {
            headerView = [[UICollectionReusableView alloc] init];
        }
        headerView.backgroundColor = [UIColor grayColor];
        
        UILabel *headerLabel = [[UILabel alloc] init];
        headerLabel.frame = CGRectMake(10, 10, 300, 30);
        headerLabel.text = @"hello 我是header";
        [headerView addSubview:headerLabel];
        
        return headerView;
    }
    else if([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerId forIndexPath:indexPath];
        if(footerView == nil)
        {
            footerView = [[UICollectionReusableView alloc] init];
        }
        footerView.backgroundColor = [UIColor lightGrayColor];
        
        UILabel *footLabel = [[UILabel alloc] init];
        footLabel.frame = CGRectMake(3, 3, 300, 20);
        footLabel.text = @"hello 我是foot";
        [footerView addSubview:footLabel];
        
        return footerView;
    }
    
    return nil;

}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    //这里需要修改数据源
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout
#pragma mark item的size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){30,30};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section==0) {
        return UIEdgeInsetsMake(15, 15, 35, 15);
    }
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15.f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15.f;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){44,44};
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return (CGSize){244,22};
}

#pragma mark ---- UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 点击高亮
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    if (cell.backgroundColor == [UIColor greenColor]) {
        cell.backgroundColor = [UIColor purpleColor];

    }else{
        cell.backgroundColor = [UIColor greenColor];

    }
}


// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.letterArray removeObjectAtIndex:indexPath.row];
    [self.letterArray insertObject:[self.letterArray objectAtIndex:indexPath.row] atIndex:0];
    [collectionView reloadData];
}
//
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    

    
    
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    cell.backgroundColor = [UIColor purpleColor];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//    });

}


// 长按某item，弹出copy和paste的菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

// 使copy和paste有效
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        return YES;
    }
    
    return NO;
}

//
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if([NSStringFromSelector(action) isEqualToString:@"copy:"])
    {
        //        NSLog(@"-------------执行拷贝-------------");
        [collectionView performBatchUpdates:^{
//            [_section0Array removeObjectAtIndex:indexPath.row];
            [collectionView deleteItemsAtIndexPaths:@[indexPath]];
        } completion:nil];
    }
    else if([NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        NSLog(@"-------------执行粘贴-------------");
    }
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
