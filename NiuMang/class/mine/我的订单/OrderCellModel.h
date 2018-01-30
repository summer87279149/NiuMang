//
//	OrderCellModel.h
//
//	Create by summer on 25/1/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface OrderCellModel : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, assign) NSInteger paymentTradeStatus;
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) NSString * shopname;
@property (nonatomic, strong) NSString * size;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * total;
@property (nonatomic, strong) NSString *num;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end

