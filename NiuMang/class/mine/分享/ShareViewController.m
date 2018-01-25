

//
//  ShareViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//
#import <UShareUI/UShareUI.h>
#import "ShareViewController.h"

@interface ShareViewController ()
@property (weak, nonatomic) IBOutlet UILabel *inviteCode;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分销推广";
    SHOWHUD
    [RequestManager getInviteCodeSuccess:^(id response) {
        HIDEHUD
        if([response[@"status"] integerValue]==1){
            _inviteCode.text = [NSString stringWithFormat:@"我的邀请码是:%@",response[@"retdata"][@"lnvitecode"]];
            
        }
    } error:^(id response) {
        
    }];
}
- (IBAction)inviteBtn:(UIButton *)sender {
    SHOWHUD
    [RequestManager writeInviteCode:self.inviteCode.text success:^(id response) {
        HIDEHUD
        if([response[@"status"]integerValue]==1){
            [MBProgressHUD showMessage:@"你已填过邀请码"];
        }else{
            if ([response[@"status"]integerValue]==1) {
                [MBProgressHUD showSuccess:@"OK"];
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
    } error:^(id response) {
        HIDEHUD
    }];
}


- (IBAction)share:(UIButton *)sender {
    
    //显示分享面板
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
    UMShareImageObject *imgObj = [UMShareImageObject shareObjectWithTitle:@"欢迎使用牛忙" descr:@"欢迎使用牛忙商城" thumImage:[UIImage imageNamed:@"屏幕快照 2018-01-16 下午4.08.25"]];
    NSString*str = [NSString stringWithFormat:@"欢迎使用牛忙商城,%@",_inviteCode.text];
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"欢迎使用牛忙" descr:str thumImage:nil];
    //设置网页地址
    shareObject.webpageUrl = @"http://www.baidu.com";
    messageObject.shareObject = imgObj;
    
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
    }];
}

@end
