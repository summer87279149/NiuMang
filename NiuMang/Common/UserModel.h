//
//  UserModel.h
//  YZGL
//
//  Created by Admin on 17/3/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#define USER_NAME                           @"ud_user_name"
#define USER_ID                             @"ud_user_id"
#define USER_PHONE                          @"phoneNumber"
#define USER_IMG                            @"ud_user_img"
#define USER_ZU                             @"ud_user_zu"
//#define USER_HEHUOREN                       @"USER_HEHUOREN"


@interface UserModel : NSObject
@property (nonatomic, strong) NSString *portrait;
@property (copy, nonatomic) NSString *userName;
//用户id
@property (copy, nonatomic) NSString *userId;
//手机号
@property (copy, nonatomic) NSString *phoneNumber;
//headimg
@property (nonatomic, copy) NSString *headimg;
//用户组
@property (nonatomic, strong) NSString *yongHuZu;
//出行价格初始值
@property (nonatomic, strong) NSString *chuXingPrice;
//跑腿首页呼叫需要支付的金额
@property (nonatomic, strong)NSString *paoTuiPrice;
//合伙人初始值
@property (nonatomic, strong) NSString *heHuoRenPrice;
//
@property (nonatomic, assign) BOOL iSHeHuoRen;
//当前城市名
@property (nonatomic, strong) NSString *currentCityName;
//当前城市id
@property (nonatomic, strong) NSString *currentCityId;
//用户经理
@property (nonatomic, strong) NSString *isJingLi;
//有没有网络
@property (nonatomic, assign) BOOL isHaveWang;
//开关,用于显示我的贷款
@property (nonatomic, assign) NSString *kaiGuan;
+(instancetype)shareManager;
-(void)save;
+(NSString *)phoneNumber;
+(NSString*)username;
+(NSString*)userimg;
+(NSString*)yongHuZu;
+(NSString *)userId;
+(BOOL)didLogin;
-(void)logOut;
+(void)closeVoice;
+(void)openVoice;
+(BOOL)isVoice;
@end
