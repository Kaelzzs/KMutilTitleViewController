//
//  MultiTitleViewController.m
//  CollectionViewDemo
//
//  Created by Kael on 16/6/7.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "MultiTitleViewController.h"
#import "FullChildViewController.h"
@implementation MultiTitleViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    // 添加所有子控制器
    [self setUpAllViewController];
    
    
    // 设置标题字体
    /*
     方式一：
     self.titleFont = [UIFont systemFontOfSize:20];
     */
    // 推荐方式
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight) {
        
        // 设置标题字体
        *titleFont = [UIFont systemFontOfSize:20];
        
    }];
    
    // 设置下标
    /*
     方式一
     // 是否显示标签
     self.isShowUnderLine = YES;
     
     // 标题填充模式
     self.underLineColor = [UIColor redColor];
     
     // 是否需要延迟滚动,下标不会随着拖动而改变
     self.isDelayScroll = YES;
     */
    
    // 推荐方式（设置下标）
    [self setUpUnderLineEffect:^(BOOL *isShowUnderLine, BOOL *isDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor) {
        
        // 是否显示标签
        *isShowUnderLine = YES;
        
        // 标题填充模式
        *underLineColor = [UIColor redColor];
        
        // 是否需要延迟滚动,下标不会随着拖动而改变
        *isDelayScroll = YES;
        
    }];
    // *推荐方式(设置遮盖)
    [self setUpCoverEffect:^(BOOL *isShowTitleCover, UIColor **coverColor, CGFloat *coverCornerRadius) {
        // 设置是否显示标题蒙版
        *isShowTitleCover = YES;
        
        // 设置蒙版颜色
        *coverColor = [UIColor colorWithWhite:0.7 alpha:0.4];
        
        // 设置蒙版圆角半径
        *coverCornerRadius = 13;
    }];
    // 设置全屏显示
    // 如果有导航控制器或者tabBarController,需要设置tableView额外滚动区域,详情请看FullChildViewController
    self.isfullScreen = YES;
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self setSelectIndex:2];
//    });
}
// 添加所有子控制器
- (void)setUpAllViewController
{
    
    // 段子
    FullChildViewController *wordVc1 = [[FullChildViewController alloc] init];
    wordVc1.title = @"小码哥";
    [self addChildViewController:wordVc1];
    
    // 段子
    FullChildViewController *wordVc2 = [[FullChildViewController alloc] init];
    wordVc2.title = @"M了个J";
    [self addChildViewController:wordVc2];
    
    // 段子
    FullChildViewController *wordVc3 = [[FullChildViewController alloc] init];
    wordVc3.title = @"啊峥";
    [self addChildViewController:wordVc3];
    
    FullChildViewController *wordVc4 = [[FullChildViewController alloc] init];
    wordVc4.title = @"吖了个峥";
    [self addChildViewController:wordVc4];
    
    // 全部
    FullChildViewController *allVc = [[FullChildViewController alloc] init];
    allVc.title = @"全部";
    [self addChildViewController:allVc];
    
    // 视频
    FullChildViewController *videoVc = [[FullChildViewController alloc] init];
    videoVc.title = @"视频";
    [self addChildViewController:videoVc];
    
    // 声音
    FullChildViewController *voiceVc = [[FullChildViewController alloc] init];
    voiceVc.title = @"声音";
    [self addChildViewController:voiceVc];
    
    // 图片
    FullChildViewController *pictureVc = [[FullChildViewController alloc] init];
    pictureVc.title = @"图片";
    [self addChildViewController:pictureVc];
    
    // 段子
    FullChildViewController *wordVc = [[FullChildViewController alloc] init];
    wordVc.title = @"段子";
    [self addChildViewController:wordVc];
    
    
    
}

@end
