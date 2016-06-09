//
//  MultiTitleView_static.m
//  CollectionViewDemo
//
//  Created by Kael on 16/6/9.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#import "MultiTitleView_static.h"

@implementation MultiTitleView_static

-(void)viewDidLoad{

    [super viewDidLoad];
    
    [self setUpAllViewController];
    
//*************************** 设置标题字体
    /*
     方式一：
     self.titleFont = [UIFont systemFontOfSize:20];
     */
    // 推荐方式
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight) {
        
        // 设置标题字体
        *titleFont = [UIFont systemFontOfSize:20];
        
    }];
    
    
    
//**************************** 设置下标
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
    
    
    
//*********************
//*************** *推荐方式(设置遮盖)  遮罩不要与 放大效果同时使用
    [self setUpCoverEffect:^(BOOL *isShowTitleCover, UIColor **coverColor, CGFloat *coverCornerRadius) {
        // 设置是否显示标题蒙版
        *isShowTitleCover = NO;
        
        // 设置蒙版颜色
        *coverColor = [UIColor colorWithWhite:0.7 alpha:0.4];
        
        // 设置蒙版圆角半径
        *coverCornerRadius = 13;
    }];
    // 设置全屏显示
    // 如果有导航控制器或者tabBarController,需要设置tableView额外滚动区域,详情请看FullChildViewController
    self.isfullScreen = YES;
    
    
    
//**********************
//********************** 推荐方式 (设置字体缩放)
    [self setUpTitleScale:^(BOOL *isShowTitleScale, CGFloat *titleScale) {
        
        // 是否需要字体缩放
        *isShowTitleScale = YES;
        
        // 字体缩放比例
        *titleScale = 1.2;
    }];
    

}



@end
