//
//  RequestManager.h
//  HLDriver
//
//  Created by Admin on 2017/4/12.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "BaseRequestManager.h"
/**
 * 没有api文档.
 * 后台不愿写,用QQ发我的.记录我已经删掉了,让他懒不写文档自己感受恐惧去吧
 * 聊天记录没保存,请君自生自灭.
 */
@interface RequestManager : BaseRequestManager
+(void)yznmLoginPhoneNumber:(NSString *)tel yzm:(NSString *)yzm success:(Success)xt_success error:(Error)xt_error;
+(void)getVerifyPhoneNum:(NSString*)phone success:(Success)xt_success error:(Error)xt_error;
+(void)homeRequestSuccess:(Success)xt_success error:(Error)xt_error;
+(void)cataRequestSuccess:(Success)xt_success error:(Error)xt_error;
+(void)goodDetailRequestid:(NSString *)idd success:(Success)xt_success error:(Error)xt_error;
+(void)getOrderWithUid:(NSString*)uid andCounts:(NSString*)counts andGoodID:(NSString*)gid success:(Success)xt_success error:(Error)xt_error;
+(void)queryOrderWithUid:(NSString*)uid success:(Success)xt_success error: (Error)xt_error;
+(void)feedbackWithContent:(NSString*)content success:(Success)xt_success error:(Error)xt_error;
+(void)getJiFenSuccess:(Success)xt_success error:(Error)xt_error;
+(void)getPortraitSuccess:(Success)xt_success error:(Error)xt_error;
+(void)getAddressSuccess:(Success)xt_success error:(Error)xt_error;
+(void)editAddressWithPara:(NSDictionary*)dic success:(Success)xt_success error:(Error)xt_error;
+(void)getInviteCodeSuccess:(Success)xt_success error:(Error)xt_error;
+(void)writeInviteCode:(NSString*)code success:(Success)xt_success error:(Error)xt_error;
+(void)getFenXiaoChengYuanSuccess:(Success)xt_success error:(Error)xt_error;
+(void)getLevelOneMembersSuccess:(Success)xt_success error:(Error)xt_error;
+(void)getLevelTwoMembersSuccess:(Success)xt_success error:(Error)xt_error;
+(void)getLevelThreeMembersSuccess:(Success)xt_success error:(Error)xt_error;
+(void)getMoneySuccess:(Success)xt_success error:(Error)xt_error;
+(void)getRestMoneySuccess:(Success)xt_success error:(Error)xt_error;
+(void)getBindBankInfoSuccess:(Success)xt_success error:(Error)xt_error;
+(void)bindBankWith:(NSString*)truename andCardNumber:(NSString*)cardnum andOwner:(NSString*)Owner andPhone:(NSString*)phone success:(Success)xt_success error:(Error)xt_error;
+(void)search:(NSString*)key success:(Success)xt_success error:(Error)xt_error;
+(void)tiXianSuccess:(Success)xt_success error:(Error)xt_error;
+(void)confirmGetMoneySuccess:(Success)xt_success error:(Error)xt_error;
@end
