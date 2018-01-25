
//
//  RequestManager.m
//  HLDriver
//
//  Created by Admin on 2017/4/12.
//  Copyright © 2017年 Admin. All rights reserved.
//
#import "RegistModel.h"
#import "XTRequestManager.h"
#import "RequestManager.h"

@implementation RequestManager
+(void)getOederDetaiOrderID:(NSString*)order_id success:(Success)xt_success error:(Error)xt_error{
    if (![UserModel userId]) {
        return ;
    }
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/orderDetail") parameters:@{@"order_id":order_id,@"did":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}

+(void)getStartAddressOrderID:(NSString *)order_id success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/arrived_start") parameters:@{@"did":[UserModel userId],@"order_id":order_id} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getDestinationAddressOrderID:(NSString *)order_id success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/arrived_end") parameters:@{@"did":[UserModel userId],@"order_id":order_id} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)changeWorkState:(WorkStateType)type success:(Success)xt_success error:(Error)xt_error{
    if (![UserModel userId]) {
        return ;
    }
    NSNumber*num ;
    if (type == WorkStateTypeWokring) {
        num = @1;
    }else{
        num = @0;
    }
    NSDictionary *para= @{@"did":[UserModel userId],@"status":num};
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/driver/status") parameters:para responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)uploadLocation:(NSString*)lon lat:(NSString*)lat success:(Success)xt_success error:(Error)xt_error{
    if(![UserModel userId]){
        return;
    }
    NSDictionary *para = @{@"did":[UserModel userId],@"device_id":@" ",@"lon":lon,@"lat":lat};
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/driver/position") parameters:para responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
         xt_error(error);
    }];
}
+(void)getUserInfoSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/driver/info") parameters:@{@"did":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getMessageSuccess:(Success)xt_success error:(Error)xt_error{
    if(![UserModel userId]){
        return;
    }
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/orderMsg") parameters:@{@"did":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getMyOrderList:(NSInteger)page success:(Success)xt_success error:(Error)xt_error{
    //这里记得改回来
    NSString *strPre = XT_REQUEST_URL(@"/api/driver/order");
    NSString *str = [NSString stringWithFormat:@"?did=%@&status=&page=%ld",[UserModel userId],(long)page];
    NSString*totalStr=[strPre stringByAppendingString:str];
    [XTRequestManager GET:totalStr parameters:nil responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)uploadProtrait:(NSString *)protrait success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/driver/avatar") parameters:@{@"did":[UserModel userId],@"avatar":protrait} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
    
}
+(void)getMyUncompleteOrderList:(NSInteger)page success:(Success)xt_success error:(Error)xt_error{
    //这里记得改回来
    NSString *strPre = XT_REQUEST_URL(@"/api/driver/order");
    NSString *str = [NSString stringWithFormat:@"?did=%@&status=1&page=%ld",[UserModel userId],(long)page];
    NSString*totalStr=[strPre stringByAppendingString:str];
    [XTRequestManager GET:totalStr parameters:nil responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)acceptOrderID:(NSString*)orderid success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/confirmOrder") parameters:@{@"did":[UserModel userId],@"order_id":orderid} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)feedback:(NSString*)content success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/driver/feedback") parameters:@{@"content":content,@"did":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
      xt_success(responseObject);
    } failure:^(NSError *error) {
      xt_error(error);  
    }];
}
+(void)loginWithPhoneNumber:(NSString *)tel password:(NSString *)psw success:(Success)xt_success error:(Error)xt_error{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:tel,@"mobile",psw,@"code",@" ",@"device_id", nil];
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/driver/login") parameters:dic responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getVerifyPhoneNum:(NSString*)phone success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/index/getCode") parameters:@{@"mobile":phone} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)verifyWithPhoneNum:(NSString*)phone code:(NSString*)code success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/index/verifiCode") parameters:@{@"mobile":phone,@"code":code} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getVehicleTypeSuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/index/truck") parameters:nil responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)griverChannerPage:(NSUInteger)page Success:(Success)xt_success error:(Error)xt_error{
    NSNumber *pageNum = [NSNumber numberWithInteger:page];
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/notice") parameters:@{@"page":pageNum} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
         xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getMyMoney:(NSString*)money success:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/extract") parameters:@{@"did":[UserModel userId],@"money":money} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)myWallatePage:(NSUInteger)page Success:(Success)xt_success error:(Error)xt_error{
    NSNumber *pageNum = [NSNumber numberWithInteger:page];
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/money") parameters:@{@"did":[UserModel userId],@"page":pageNum} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)registWithSuccess:(Success)xt_success error:(Error)xt_error{
    RegistModel*model = [RegistModel shareManager];

    NSDictionary *para = [NSDictionary dictionaryWithObjectsAndKeys:
                          model.phoneNum,@"mobile",
                          model.verifyCode,@"code",
                          @"device_id",@"device_id",
                          model.name,@"name",
                          model.idcard,@"idnumber",
                          model.creditCard,@"card_number",
                          model.bank_name ,@"bank_name",
                          model.address,@"regionid",
                          model.vehicleType,@"truckid",
                          model.chePai ,@"car_number",
                          model.idCardImg,@"idcard",
                          model.jiaShiZhengImg,@"driver_license",
                          model.xingShiZhengImg,@"driving_license",
                          model.cheLiang45Img,@"car_photo"
                          , nil];
//    NSDictionary *para = @{@"bank_name" : @"plist%E6%96%87%E4%BB%B6%E4%B8%AD%E4%B8%8D%E5%AD%98%E5%9C%A8%E8%AF%B7%E8%87%AA%E8%A1%8C%E6%B7%BB%E5%8A%A0%E5%AF%B9%E5%BA%94%E5%8D%A1%E7%A7%8D",
//                          @"car_number" : @"%E4%BA%ACL88999",
//                          @"car_photo" : @"configSITE_URL/Uploads/2017-04-12/58edeea84bd27.jpg",
//                          @"card_number" : @422801197507232815,
//                          @"code" : @3671,
//                          @"device_id" : @"device_id",
//                          @"driver_licence" : @"configSITE_URL/Uploads/2017-04-12/58edeeab9f57d.jpg",
//                          @"driving_license" : @"configSITE_URL/Uploads/2017-04-12/58edeea4535fd.jpg",
//                          @"idcard" : @"configSITE_URL/Uploads/2017-04-12/58edeea012e7c.jpg",
//                          @"idnumber" : @321027199006136927,
//                          @"mobile" : @18101508289,
//                          @"name" : @"%E5%9B%A0%E4%B8%BA",
//                          @"regionid" : @30,
//                          @"truckid" : @3};
//    NSDictionary *para = @{@"mobile":model.phoneNum,
//                           @"code":model.verifyCode,
//                           @"device_id":@"device_id",
//                           @"name": [model.name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
//                           @"idnumber":model.idcard,
//                           @"card_number":model.creditCard,
//                           @"bank_name":[model.bank_name stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
//                           @"regionid":model.address,
//                           @"truckid":model.vehicleType,
//                           @"car_number":[model.chePai stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
//                           @"idcard":model.idCardImg,
//                           @"driver_licence":model.jiaShiZhengImg,
//                           @"driving_license":model.xingShiZhengImg,
//                           @"car_photo":model.cheLiang45Img
//                           };
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/driver/register") parameters:para responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}

+(void)uploadImg:(UIImage*)image success:(Success)xt_success error:(Error)xt_error{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    // 设置时间格式
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *str = [formatter stringFromDate:[NSDate date]];
    NSString *fileName = [NSString stringWithFormat:@"%@.jpg",str];
    [XTRequestManager POST:XT_REQUEST_URL(@"/api/index/upload") parameters:@{@"name":@"filedata"} responseSeializerType:NHResponseSeializerTypeDefault constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        NSData *data = UIImageJPEGRepresentation(image, 1);
        [formData appendPartWithFileData:data name:@"filedata" fileName:fileName mimeType:@"image/jpeg"];
    } success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)getCitySuccess:(Success)xt_success error:(Error)xt_error{
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/index/region") parameters:nil responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);
    }];
}
+(void)myAchievementSuccess:(Success)xt_success error:(Error)xt_error{
    if(![UserModel userId]){
        return;
    }
    [XTRequestManager GET:XT_REQUEST_URL(@"/api/driver/statistic") parameters:@{@"did":[UserModel userId]} responseSeializerType:NHResponseSeializerTypeDefault success:^(id responseObject) {
        xt_success(responseObject);
    } failure:^(NSError *error) {
        xt_error(error);

    }];
}
@end
