//
//  HeaderCycleView.h
//  NiuMang
//
//  Created by Admin on 2017/10/8.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "HeaderBottomView.h"
#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
typedef void (^Callback)(NSInteger);

@interface HeaderCycleView : UICollectionReusableView<SDCycleScrollViewDelegate,UISearchBarDelegate>
@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, copy) Callback callback;
@property (nonatomic, strong) SDCycleScrollView *topScrollView;
@property (nonatomic, strong) HeaderBottomView*bottomView;
@property (nonatomic, strong) UISearchBar *searchBar;
@end
