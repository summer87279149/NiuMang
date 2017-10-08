

//
//  HeaderCycleView.m
//  NiuMang
//
//  Created by Admin on 2017/10/8.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "HeaderCycleView.h"

@implementation HeaderCycleView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//  只能在这里请求网络数组
            WS(weakSelf)
            UISearchBar *bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
            bar.delegate = weakSelf;
            [self addSubview:bar];
            self.topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 40, kScreenWidth, kScreenWidth*0.6) imageNamesGroup:@[@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4246448900,3308082892&fm=175&s=0D51AB4E47BA8A7D4470B00B0100D0C2&w=639&h=426&img.JPEG",@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4246448900,3308082892&fm=175&s=0D51AB4E47BA8A7D4470B00B0100D0C2&w=639&h=426&img.JPEG"]];
            self.topScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
            self.topScrollView.delegate = weakSelf;
            [self addSubview:self.topScrollView];
        }
    return self;
}

    
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if(self.callback){
        self.callback(-1);
    }
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if(self.callback){
        self.callback(index);
    }
}
@end
