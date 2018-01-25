//
//  GoodsDetailViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/8.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "WXApi.h"
#import "WXApiRequestHandler.h"
#import "WXApiObject.h"
#import "BuyDetailView.h"
#import <UShareUI/UShareUI.h>
#import "GoodsDetailViewController.h"

@interface GoodsDetailViewController ()

@property (nonatomic, assign) int num;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *danjia;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *shengYu;
@property (weak, nonatomic) IBOutlet UILabel *yunFei;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) BuyDetailView *buyDetailView;
@end

@implementation GoodsDetailViewController
-(BuyDetailView*)buyDetailView{
    if(!_buyDetailView){
        _buyDetailView = (BuyDetailView *)[[UINib nibWithNibName:@"BuyDetailView" bundle:nil]instantiateWithOwner:self options:nil][0];
        _buyDetailView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 342);
        [[RACObserve(self, num) filter:^BOOL(id  _Nullable value) {
            return [value intValue]<1?NO:YES;
        }] subscribeNext:^(id  _Nullable x) {
            _buyDetailView.nums.text = [NSString stringWithFormat:@"%d",[x intValue]];
        }];
        RAC(_buyDetailView.imgView,image) = RACObserve(self.imgView, image);
        RAC(_buyDetailView.name,text) = RACObserve(self.name, text);
        RAC(_buyDetailView.price,text) = RACObserve(self.price, text);
        RAC(_buyDetailView.shengYu,text) = [RACObserve(self.shengYu, text)map:^id _Nullable(id  _Nullable value) {
            return [NSString stringWithFormat:@"剩余%@",value];
        }];
    }
    return _buyDetailView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";
    self.num = 1;
    
    [RequestManager goodDetailRequestid:self.goodID success:^(id response) {
        NSDictionary *dic = response[@"retdata"][0];
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://srdb.yzszsf.com/static/goodsimage/%@",dic[@"pic"]]]];
        self.name.text = dic[@"goods_name"];
        self.price.text = [NSString stringWithFormat:@"价格:%@元",dic[@"price"]];
        self.danjia.text = [NSString stringWithFormat:@":%@元",dic[@"price"]];
        self.weight.text = [NSString stringWithFormat:@"%@",dic[@"size"]];
        self.shengYu.text = [NSString stringWithFormat:@"%@件",dic[@"store"]];
        self.yunFei.text = [NSString stringWithFormat:@"%@元",dic[@"freight"]];
    } error:^(id response) {        
    }];
    [self.view addSubview:self.buyDetailView];
}
- (IBAction)goToShop:(UIButton *)sender {
    UITabBarController*tabbar = (UITabBarController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    tabbar.selectedIndex = 0;
}

- (IBAction)kefu:(UIButton *)sender {
     [self.navigationController popToRootViewControllerAnimated:NO];
    UITabBarController*tabbar = (UITabBarController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    tabbar.selectedIndex = 2;
}
- (IBAction)shangCheng:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:NO];
    UITabBarController*tabbar = (UITabBarController*)[UIApplication sharedApplication].delegate.window.rootViewController;
    tabbar.selectedIndex = 0;
}
- (IBAction)share:(UIButton *)sender { //显示分享面板
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        NSLog(@"根据获取的platformType确定所选平台进行下一步操作%ld",(long)platformType);
        [self shareWebPageToPlatformType:platformType];
    }];
}
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
//    NSString* thumbURL =  @"https://www.baidu.com";
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"欢迎使用牛忙" descr:@"欢迎使用牛忙商城" thumImage:nil];
    //设置网页地址
    shareObject.webpageUrl = @"http://www.baidu.com";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        //        [self alertWithError:error];
    }];
}
- (IBAction)decrease:(UIButton *)sender {
    self.num--;
}

- (IBAction)increase:(UIButton *)sender {
    self.num++;
}

- (IBAction)buy:(UIButton *)sender {
    if([UserModel didLogin]){
        [self.view addSubview:self.maskView];
        [self.view bringSubviewToFront:self.buyDetailView];
        [UIView animateWithDuration:0.3f animations:^{
            _maskView.alpha = 0.4;
            self.buyDetailView.frame = CGRectMake(0, kScreenHeight-342, kScreenWidth, 342);
        }];
    }else{
        [self presentViewController:[DengRuViewController new] animated:YES completion:nil];
    }
}

- (IBAction)submitOrder:(UIButton *)sender {
    [RequestManager getOrderWithUid:[UserModel userId] andCounts:[NSString stringWithFormat:@"%d",self.num] andGoodID:self.goodID success:^(id response) {
        if ([response[@"status"] intValue]==1) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OK" message:@"您的订单已开始备货,请耐心等待送货上门" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self.navigationController popViewControllerAnimated:YES];
            }];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
        }else{
            [WXApiRequestHandler jumpToBizPay:response[@"data"]];
        }
    } error:^(id response) {
    }];
}

-(UIView*)maskView{
    if(!_maskView){
        _maskView = [[UIView alloc]initWithFrame:self.view.bounds];
        _maskView.backgroundColor = [UIColor lightGrayColor];
        _maskView.alpha = 0;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelMask)];
        [_maskView addGestureRecognizer:tap];
        
    }
    return _maskView;
}

-(void)cancelMask{
 
    [UIView animateWithDuration:0.3f animations:^{
        self.maskView.alpha = 0;
        self.buyDetailView.frame = CGRectMake(0, kScreenHeight, kScreenWidth, 342);
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
    }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
