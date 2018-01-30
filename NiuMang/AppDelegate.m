//
//  AppDelegate.m
//  NiuMang
//
//  Created by Admin on 2017/10/8.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "WXApi.h"
#import "MineViewController.h"
#import <Bugly/Bugly.h>
#import <UMSocialCore/UMSocialCore.h>
#import "AppDelegate.h"
#define USHARE_DEMO_APPKEY       @"5a531724b27b0a51bb000080"
#define USHARE_WX_APPKEY         @"wx4295a62d7d6dfdaa"
#define USHARE_WX_APPSCRECT      @"493b41b1ad13a29038fdfaa3e38e46d7"
#define Bugly_APPID              @"0cc7438361"
@interface AppDelegate ()<UITabBarControllerDelegate,WXApiDelegate>
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //向微信注册wx4f58ec9ce04c7d8c
    [WXApi registerApp:USHARE_WX_APPKEY];
    [self setupBugly];
    [self setupUmeng];
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *tab = (UITabBarController *)self.window.rootViewController ;
    tab.delegate = self;
    return YES;
}

-(void)setupBugly{
    [Bugly startWithAppId:Bugly_APPID];
}
-(void)setupUmeng{
    // 打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];
    // 设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:USHARE_DEMO_APPKEY];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:USHARE_WX_APPKEY appSecret:USHARE_WX_APPSCRECT redirectURL:nil];
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    UINavigationController *nav =(UINavigationController*) viewController;
    if ([nav.tabBarItem.title isEqualToString:@"我的"]) {
        if ([UserModel  userId]) {
            return YES;
        }else{
            [tabBarController presentViewController:[DengRuViewController new] animated:YES completion:nil];
            return NO;
        }
    }else{
        return YES;
    }
    
}

#pragma mark - 微信支付回调

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
        [WXApi handleOpenURL:url delegate:self];
    }
    return  result;
}
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
    }else{
        //微信支付回调
        [WXApi handleOpenURL:url delegate:self];
    }
    return result;
}


#pragma mark - WXApiDelegate

- (void)onResp:(BaseResp *)resp
{    // [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    if([resp isKindOfClass:[PayResp class]]){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"listenWXpayResults" object:self userInfo:@{@"resultDic":resp}];
    }
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    if ([url.host isEqualToString:@"safepay"]) {
    }else{
        [WXApi handleOpenURL:url delegate:self];
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
  }


- (void)applicationWillEnterForeground:(UIApplication *)application {
  }


- (void)applicationDidBecomeActive:(UIApplication *)application {
  }


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
