//
//  RequestManager.h
//  HLDriver
//
//  Created by Admin on 2017/4/12.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "BaseRequestManager.h"
typedef NS_ENUM(NSUInteger ,WorkStateType){
    WorkStateTypeWokring,
    WorkStateTypeRest
};
@interface RequestManager : BaseRequestManager
/**
 *  登入
 *
 *  @param tel        手机号
 *  @param psw        密码
 *  @param xt_success 成功回调
 *  @param xt_error   失败回调
 */
+(void)loginWithPhoneNumber:(NSString *)tel password:(NSString *)psw success:(Success)xt_success error:(Error)xt_error;
//得到验证码
+(void)getVerifyPhoneNum:(NSString*)phone success:(Success)xt_success error:(Error)xt_error;
//验证验证码
+(void)verifyWithPhoneNum:(NSString*)phone code:(NSString*)code success:(Success)xt_success error:(Error)xt_error;
//获得车型数据
+(void)getVehicleTypeSuccess:(Success)xt_success error:(Error)xt_error;
//注册
/**
 注册
 */
+(void)registWithSuccess:(Success)xt_success error:(Error)xt_error;
//上传图片
+(void)uploadImg:(UIImage*)image success:(Success)xt_success error:(Error)xt_error;
//获得城市
+(void)getCitySuccess:(Success)xt_success error:(Error)xt_error;
//反馈意见
+(void)feedback:(NSString*)content success:(Success)xt_success error:(Error)xt_error;

/**
 获取所有订单（设置页获取）

 @param page <#page description#>
 @param xt_success <#xt_success description#>
 @param xt_error <#xt_error description#>
 */
+(void)getMyOrderList:(NSInteger)page success:(Success)xt_success error:(Error)xt_error;

/**
 获取未完成的订单（首页获取）

 @param page <#page description#>
 @param xt_success <#xt_success description#>
 @param xt_error <#xt_error description#>
 */
+(void)getMyUncompleteOrderList:(NSInteger)page success:(Success)xt_success error:(Error)xt_error;
//获取消息
+(void)getMessageSuccess:(Success)xt_success error:(Error)xt_error;
//上下班
+(void)changeWorkState:(WorkStateType)type success:(Success)xt_success error:(Error)xt_error;
//到达起点确认
+(void)getStartAddressOrderID:(NSString *)order_id success:(Success)xt_success error:(Error)xt_error;
//到达终点确认
+(void)getDestinationAddressOrderID:(NSString *)order_id success:(Success)xt_success error:(Error)xt_error;
//获取订单详情
+(void)getOederDetaiOrderID:(NSString*)order_id success:(Success)xt_success error:(Error)xt_error;
//上报位置
+(void)uploadLocation:(NSString*)lon lat:(NSString*)lat success:(Success)xt_success error:(Error)xt_error;
//获取用户信息
+(void)getUserInfoSuccess:(Success)xt_success error:(Error)xt_error;
//确认接受订单消息中的订单
+(void)acceptOrderID:(NSString*)orderid success:(Success)xt_success error:(Error)xt_error;
//司机频道
+(void)griverChannerPage:(NSUInteger)page Success:(Success)xt_success error:(Error)xt_error;
//我的钱包
+(void)myWallatePage:(NSUInteger)page Success:(Success)xt_success error:(Error)xt_error;
//提现
+(void)getMyMoney:(NSString*)money success:(Success)xt_success error:(Error)xt_error;
//我的成就
+(void)myAchievementSuccess:(Success)xt_success error:(Error)xt_error;
//上传头像
+(void)uploadProtrait:(NSString *)protrait success:(Success)xt_success error:(Error)xt_error;

@end
