

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
        NSMutableArray *arr = [NSMutableArray array];
//  只能在这里请求网络数组
        [RequestManager homeRequestSuccess:^(id response) {
            NSArray*scrollImg = response[@"retdata"][@"info"];
            for (NSDictionary*dic in scrollImg) {
                NSString*str = dic[@"img"];
                [arr addObject:XT_IMAGE_URL(str)];
            }
            self.topScrollView .imageURLStringsGroup = arr;
            
        } error:^(id response) {
            
        }];
            WS(weakSelf)
            UISearchBar *bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
            bar.delegate = weakSelf;
            self.searchBar =bar;
            [self addSubview:bar];
            self.topScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 40, kScreenWidth, kScreenWidth*0.6) imageNamesGroup:@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1516362268054&di=9142208de8dcae5966eae45784ef8aa6&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F20%2F02%2F16pic_2002642_b.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1516362268054&di=9142208de8dcae5966eae45784ef8aa6&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F20%2F02%2F16pic_2002642_b.jpg"]];
            self.topScrollView.placeholderImage = [UIImage imageNamed:@"placeholder"];
            self.topScrollView.delegate = weakSelf;
            [self addSubview:self.topScrollView];
            UINib *nib = [UINib nibWithNibName:@"HeaderBottomView" bundle:nil];
            self.bottomView = [nib instantiateWithOwner:nil options:nil][0];
            self.bottomView.tag = 2555;
            [self addSubview:self.bottomView];
//            vi.frame = CGRectMake(0, 40+kScreenWidth*0.6, kScreenWidth, 50);
//            vi.backgroundColor = [UIColor redColor];
        }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.bottomView = [self viewWithTag:2555];
    self.bottomView.frame = CGRectMake(0, 25 +kScreenWidth*0.6, kScreenWidth, 55);
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
