

#import "XTRequestManager.h"
static int XTNetworkStatus = AFNetworkReachabilityStatusReachableViaWiFi;
@interface AFHTTPSessionManager (Shared)
// 设置为单利
+ (instancetype)sharedManager;
@end

@implementation AFHTTPSessionManager (Shared)
+ (instancetype)sharedManager {
    static AFHTTPSessionManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [AFHTTPSessionManager manager];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
        // 监听网络状况
        AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
        [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            switch (status) {

                case AFNetworkReachabilityStatusNotReachable:
                    XTNetworkStatus = AFNetworkReachabilityStatusNotReachable;
                    [[NSNotificationCenter defaultCenter]postNotificationName:NetWorkStatusChanged object:nil userInfo:@{@"status":@"0"}];
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi:
                    XTNetworkStatus = AFNetworkReachabilityStatusReachableViaWiFi;
                    [[NSNotificationCenter defaultCenter]postNotificationName:NetWorkStatusChanged object:nil userInfo:@{@"status":@"1"}];
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN:
                    XTNetworkStatus = AFNetworkReachabilityStatusReachableViaWWAN;
                    [[NSNotificationCenter defaultCenter]postNotificationName:NetWorkStatusChanged object:nil userInfo:@{@"status":@"2"}];
                    break;
                default:
                    break;
            }
        }];
        [mgr startMonitoring];
    
    });
    return _instance;
}
@end


@implementation XTRequestManager

// GET请求
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
responseSeializerType:(NHResponseSeializerType)type
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure {
    if (XTNetworkStatus==AFNetworkReachabilityStatusNotReachable) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showMessage:@"无网络" toView:[UIApplication sharedApplication].keyWindow];
        });
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
//    manager.requestSerializer.cachePolicy= NSURLRequestReloadIgnoringCacheData;
    manager.requestSerializer.timeoutInterval=10.f;
       // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != NHResponseSeializerTypeJSON && type != NHResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败
        if (failure) {
//            [MBProgressHUD showError:@"请求超时，请检查网络状况"];
            NSLog(@"请求失败统一返回错误信息:%@",error);
            failure(error);
        }
    }];
}


// POST请求
+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
responseSeializerType:(NHResponseSeializerType)type
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure {
    if (XTNetworkStatus==AFNetworkReachabilityStatusNotReachable) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD showMessage:@"无网络" toView:[UIApplication sharedApplication].keyWindow];
        });
//        [MBProgressHUD showMessage:@"无网络" toView:[UIApplication sharedApplication].keyWindow];
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    manager.requestSerializer.timeoutInterval=10.f;

    
    // 如果不是JSON 或者 不是Default 才设置解析器类型
    if (type != NHResponseSeializerTypeJSON && type != NHResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    //  https证书设置
    
//    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//    policy.allowInvalidCertificates = YES;
//    manager.securityPolicy  = policy;
//
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
              success(responseObject);
        }
//        NSLog(@"%@", responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {

        // 失败
        if (failure) {
            dispatch_async(dispatch_get_main_queue(), ^{
//                HIDEHUD
                failure(error);
                NSLog(@"post请求失败统一返回错误信息:%@",error);
            });
            
        }
    }];
}


// POST请求 上传数据
+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
responseSeializerType:(NHResponseSeializerType)type
constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure {
    if (XTNetworkStatus==AFNetworkReachabilityStatusNotReachable) {
        [MBProgressHUD showMessage:@"无网络" toView:[UIApplication sharedApplication].keyWindow];
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    manager.requestSerializer.timeoutInterval=10.f;
    
    if (type != NHResponseSeializerTypeJSON && type != NHResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
   
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        if (block) {
            block(formData);
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@", responseObject);
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@", error);
        if (failure) {
            failure(error);
        }
        
    }];
}


/**
 *  设置数据解析器类型
 *  @param serilizerType 数据解析器类型
 */
+ (AFHTTPResponseSerializer *)responseSearalizerWithSerilizerType:(NHResponseSeializerType)serilizerType {
    
    switch (serilizerType) {
            
        case NHResponseSeializerTypeDefault: // default is JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeJSON: // JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeXML: // XML
            return [AFXMLParserResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypePlist: // Plist
            return [AFPropertyListResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeCompound: // Compound
            return [AFCompoundResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeImage: // Image
            return [AFImageResponseSerializer serializer];
            break;
            
        case NHResponseSeializerTypeData: // Data
            return [AFHTTPResponseSerializer serializer];
            break;
            
        default:  // 默认解析器为 JSON解析
            return [AFJSONResponseSerializer serializer];
            break;
    }
}

+ (void)cancelAllRequests {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    [manager.operationQueue cancelAllOperations];
}
@end
