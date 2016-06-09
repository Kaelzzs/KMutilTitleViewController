//
//  KDisplayHeader.h
//  CollectionViewDemo
//
//  Created by Kael on 16/6/7.
//  Copyright © 2016年 创维海通. All rights reserved.
//

#ifndef KDisplayHeader_h
#define KDisplayHeader_h


#import "KMutiTitleDisplayViewController.h"

//导航条高度
static CGFloat const KNavBarHeigh = 64;

//标题滚动视图高度
static CGFloat const KTitleScrollViewHeigh = 44;

// 标题缩放比例
static CGFloat const KTitleTransformScale = 1.3;

//下划线默认高度
static CGFloat const KUnderLineHeigh = 2;

#define KScreenW [UIScreen mainScreen].bounds.size.width
#define KScreenH [UIScreen mainScreen].bounds.size.height

//是否使用固定宽度的标题
#define isStaticTitleWidth NO

#define staticTitleWidth   (KScreenW/320)*80
#define kScaleRate          (KScreenW/320)


// 默认标题字体
#define KTitleFont [UIFont systemFontOfSize:15]

// 默认标题间距
static CGFloat const margin = 20;


static NSString * const ID = @"cell";


// 标题被点击或者内容滚动完成，会发出这个通知，监听这个通知，可以做自己想要做的事情，比如加载数据
static NSString * const KDisplayViewClickOrScrollDidFinshNote = @"KDisplayViewClickOrScrollDidFinshNote";

// 重复点击通知
static NSString * const KDisplayViewRepeatClickTitleNote = @"KDisplayViewRepeatClickTitleNote";















#endif /* KDisplayHeader_h */
