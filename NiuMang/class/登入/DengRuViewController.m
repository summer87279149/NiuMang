//
//  DengRuViewController.m
//  Running
//
//  Created by Admin on 2017/10/19.
//  Copyright © 2017年 summer. All rights reserved.
//
#import "WXApi.h"
#import <UMSocialCore/UMSocialCore.h>
#import "BaseNavViewController.h"
#import "DengRuViewController.h"
@interface DengRuViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *wxLabel;
@property (weak, nonatomic) IBOutlet UIButton *wxbtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topCons;

@property (weak, nonatomic) IBOutlet UIButton *yzmBtn;
@end

@implementation DengRuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登入";
    if(iPhoneX){
        self.topCons.constant = 60;
    }else{
        self.topCons.constant = 30;
    }

}




- (IBAction)loginClicked:(UIButton *)sender {
        SHOWHUD
        [RequestManager yznmLoginPhoneNumber:self.phoneNumber.text yzm:self.pwd.text success:^(id response) {
            HIDEHUD
            NSLog(@"%@",response);
            if ([response[@"status"] integerValue]==1) {
                [UserModel shareManager].userId = response[@"uid"];
                [[UserModel shareManager] save];
                [MBProgressHUD showSuccess:@"ok"];
                [self dismissViewControllerAnimated:YES completion:nil];
            }else{
                [MBProgressHUD showError:@"网络错误:(" toView:self.view];
            }
            NSLog(@"登入结果%@",response);
        } error:^(id response) {
            HIDEHUD
            [MBProgressHUD showError:@"网络错误" toView:self.view];
        }];
}
- (IBAction)cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)weixin:(UIButton *)sender {
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:self completion:^(id result, NSError *error) {
        if (error) {
            NSLog(@"error == %@",error);
        }else {
            UMSocialUserInfoResponse *resp = result;
            //        发送数据   /** 向后台发送json格式的数据传输值 */
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            //申明返回的结果是json类型   申明请求的数据是json类型
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            //申明请求的数据是json类型
            manager.requestSerializer=[AFJSONRequestSerializer serializer];

            NSMutableDictionary *WXParameters = [NSMutableDictionary dictionaryWithCapacity:3];
            WXParameters[@"openid"]     = resp.openid;
            WXParameters[@"name"]       = resp.name;
            WXParameters[@"iconurl"] = resp.iconurl;
            NSLog(@"%@",WXParameters);
            [manager POST:@"http://srdb.yzszsf.com/api/register/extendLogin" parameters:WXParameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"responseObject=%@",responseObject);
                
                    //把请求返回的数据 储存起来 (储存用户数据)?
                    [UserModel shareManager].userId = responseObject[@"data"][@"userId"];
                    [[UserModel shareManager] save];
                
                
                    [self dismissViewControllerAnimated:YES completion:nil];
               
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [MBProgressHUD showError:@"登录失败" toView:self.view];
            }];
        }
        
    }];
}




- (IBAction)yanZhengMa:(UIButton *)sender {
    if(self.phoneNumber.text.length>10){
        [UserTool codeCountDownTimerWith:sender];
        [RequestManager getVerifyPhoneNum:self.phoneNumber.text success:^(id response) {
            [MBProgressHUD showSuccess:@"发送成功" toView:self.view];
        } error:^(id response) {
            [MBProgressHUD showSuccess:@"发送失败" toView:self.view];
        }];
    }else{
        [MBProgressHUD showError:@"请输入正确的手机号" toView:self.view];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

@end
