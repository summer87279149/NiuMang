//
//  RequestManager.m
//  HLDriver
//
//  Created by Admin on 2017/4/12.
//  Copyright © 2017年 Admin. All rights reserved.
//
#import "XTRequestManager.h"
#import "RequestManager.h"

@implementation RequestManager
//获取验证码 ok
+(void)getVerifyPhoneNum:(NSString*)phone success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/register/goBackCode") parameters:@{@"tel":phone} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
//短信登入 ok
+(void)yznmLoginPhoneNumber:(NSString *)tel yzm:(NSString *)yzm success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/register/insert") parameters:@{@"tel":tel,@"sryzm":yzm} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)homeRequestSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/shopping/index") parameters:nil responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue]==1) {
            xt_success(responseObject);
        }else{
//            [MBProgressHUD showError:responseObject[@"status"]];
        }
        
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)cataRequestSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/shopping/fshop") parameters:nil responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)goodDetailRequestid:(NSString *)idd success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/shopping/showgood") parameters:@{@"id":idd} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        if ([responseObject[@"status"] integerValue]==1) {
            xt_success(responseObject);
        }else{
//            [MBProgressHUD showError:responseObject[@"status"]];
        }
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)queryOrderWithUid:(NSString*)uid success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/order/myorder") parameters:@{@"uid":uid} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
         xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getOrderWithUid:(NSString*)uid andCounts:(NSString*)counts andGoodID:(NSString*)gid success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/order/buy") parameters:@{@"num":counts,@"uid":uid,@"gid":gid} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)feedbackWithContent:(NSString*)content success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/feedback") parameters:@{@"uid":[UserModel userId],@"content":content} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getJiFenSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/integral") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getPortraitSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/mypic") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getAddressSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/address") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)editAddressWithPara:(NSDictionary*)dic success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/editaddress") parameters:dic responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getInviteCodeSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/lnvitecode") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)writeInviteCode:(NSString*)code success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/wcode") parameters:@{@"uid":[UserModel userId],@"invitecode":code} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getFenXiaoChengYuanSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/member") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}

+(void)getLevelOneMembersSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/onemember") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}

+(void)getLevelTwoMembersSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/twomember") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}

+(void)getLevelThreeMembersSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/threemember") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getMoneySuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/mywallet") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getRestMoneySuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/mywallet") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)bindBankWith:(NSString*)truename andCardNumber:(NSString*)cardnum andOwner:(NSString*)Owner andPhone:(NSString*)phone success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/updatecard") parameters:@{@"uid":[UserModel userId],
                                                                               @"name":truename,
                                                                               @"phone":phone,
                                                                               @"b_card":cardnum,
                                                                               @"b_name":Owner,
                                                                               } responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getBindBankInfoSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/bindcard") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)search:(NSString*)key success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/shopping/search") parameters:@{@"string":key} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)tiXianSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/tixian") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)confirmGetMoneySuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/myinfo/quetixian") parameters:@{@"uid":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)wxPayWithOrder_sn:(NSString*)order_sn andPrice:(NSString*)price success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/pay/zhifu") parameters:@{@"uid":[UserModel userId],@"order_sn":order_sn,@"price":price} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
@end
