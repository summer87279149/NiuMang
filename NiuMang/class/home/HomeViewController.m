//
//  HomeViewController.m
//  NiuMang
//
//  Created by Admin on 2017/10/8.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "SearchResultViewController.h"
#import <UShareUI/UShareUI.h>
#import "GoodsDetailViewController.h"
#import "HomeCellModel.h"
#import "HeaderCycleView.h"
#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HeaderCycleView.h"
@interface HomeViewController()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property (weak, nonatomic) IBOutlet UIImageView *erweima;
@property (weak, nonatomic) IBOutlet UIButton *mask;
@property (nonatomic, strong) NSMutableArray *cellArr;
@property (nonatomic, strong) HeaderCycleView *scrollBtmView;
@end

@implementation HomeViewController
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.cellArr = [NSMutableArray array];
    SHOWHUD
    [RequestManager homeRequestSuccess:^(id response) {
        NSArray*cellDatas = response[@"retdata"][@"res"];
        for (NSDictionary*dic in cellDatas) {
            HomeCellModel *model = [[HomeCellModel alloc]initWithDictionary:dic];
            [self.cellArr addObject:model];
        }
        [self.collectionview reloadData];
        self.scrollBtmView.bottomView.fans.text = [NSString stringWithFormat:@"%@",response[@"retdata"][@"num"]];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"UPDATE_FANS_NUMBER" object:nil];
        HIDEHUD
    } error:^(id response) {
        
    }];    
}
- (IBAction)share:(UIButton *)sender {
    //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        [self shareWebPageToPlatformType:platformType];
    }];
}
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    NSString* thumbURL =  @"https://itunes.apple.com/cn/app/%E7%89%9B%E5%BF%99%E5%95%86%E5%9F%8E/id1339982860?mt=8";
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"欢迎使用牛忙" descr:@"欢迎使用牛忙商城" thumImage:nil];
    shareObject.webpageUrl = @"https://itunes.apple.com/cn/app/%E7%89%9B%E5%BF%99%E5%95%86%E5%9F%8E/id1339982860?mt=8";
    messageObject.shareObject = shareObject;
    
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                UMSocialLogInfo(@"response message is %@",resp.message);
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        //        [self alertWithError:error];
    }];
}
- (IBAction)maskClicked:(UIButton *)sender {
    self.mask.hidden = YES;
     self.erweima.hidden = YES;
}
- (IBAction)showErWeiMa:(UIButton *)sender {
    self.erweima.hidden = NO;
    self.mask.hidden = NO;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.cellArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.model = self.cellArr[indexPath.row];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HeaderCycleView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeadView" forIndexPath:indexPath];
         __weak __typeof(reusableview) weakSearch = reusableview;
        WS(weakSelf)
        reusableview.callback = ^(NSInteger integer){
            if(integer<0){
                //点击搜索
                SearchResultViewController*vc = [SearchResultViewController new];
                vc.searchKey =  weakSearch.searchBar.text;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }else{
                //点击图片
            }
            NSLog(@"数字是:%ld",integer);
        };
    }
    self.scrollBtmView = reusableview;
    return reusableview;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCellModel *model = self.cellArr[indexPath.row];
    GoodsDetailViewController*vc = [[GoodsDetailViewController alloc]init];
    vc.goodID = [NSString stringWithFormat:@"%ld",(long)model.gid];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(kScreenWidth, kScreenWidth*0.6+50+30);
}

- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth/2, kScreenWidth/2);
}






#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
