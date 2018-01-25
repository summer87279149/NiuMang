//
//	OrderCellModel.m
//
//	Create by summer on 25/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "OrderCellModel.h"

NSString *const kOrderCellModelCount = @"count";
NSString *const kOrderCellModelGoodsName = @"goods_name";
NSString *const kOrderCellModelPaymentTradeStatus = @"payment_trade_status";
NSString *const kOrderCellModelPic = @"pic";
NSString *const kOrderCellModelShopname = @"shopname";
NSString *const kOrderCellModelSize = @"size";
NSString *const kOrderCellModelStatus = @"status";
NSString *const kOrderCellModelTime = @"time";
NSString *const kOrderCellModelTotal = @"total";

@interface OrderCellModel ()
@end
@implementation OrderCellModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kOrderCellModelCount] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[kOrderCellModelCount] integerValue];
	}

	if(![dictionary[kOrderCellModelGoodsName] isKindOfClass:[NSNull class]]){
		self.goodsName = dictionary[kOrderCellModelGoodsName];
	}	
	if(![dictionary[kOrderCellModelPaymentTradeStatus] isKindOfClass:[NSNull class]]){
		self.paymentTradeStatus = [dictionary[kOrderCellModelPaymentTradeStatus] integerValue];
	}

	if(![dictionary[kOrderCellModelPic] isKindOfClass:[NSNull class]]){
		self.pic = dictionary[kOrderCellModelPic];
	}	
	if(![dictionary[kOrderCellModelShopname] isKindOfClass:[NSNull class]]){
		self.shopname = dictionary[kOrderCellModelShopname];
	}	
	if(![dictionary[kOrderCellModelSize] isKindOfClass:[NSNull class]]){
		self.size = dictionary[kOrderCellModelSize];
	}	
	if(![dictionary[kOrderCellModelStatus] isKindOfClass:[NSNull class]]){
		self.status = [dictionary[kOrderCellModelStatus] integerValue];
	}

	if(![dictionary[kOrderCellModelTime] isKindOfClass:[NSNull class]]){
		self.time = dictionary[kOrderCellModelTime];
	}	
	if(![dictionary[kOrderCellModelTotal] isKindOfClass:[NSNull class]]){
		self.total = dictionary[kOrderCellModelTotal];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kOrderCellModelCount] = @(self.count);
	if(self.goodsName != nil){
		dictionary[kOrderCellModelGoodsName] = self.goodsName;
	}
	dictionary[kOrderCellModelPaymentTradeStatus] = @(self.paymentTradeStatus);
	if(self.pic != nil){
		dictionary[kOrderCellModelPic] = self.pic;
	}
	if(self.shopname != nil){
		dictionary[kOrderCellModelShopname] = self.shopname;
	}
	if(self.size != nil){
		dictionary[kOrderCellModelSize] = self.size;
	}
	dictionary[kOrderCellModelStatus] = @(self.status);
	if(self.time != nil){
		dictionary[kOrderCellModelTime] = self.time;
	}
	if(self.total != nil){
		dictionary[kOrderCellModelTotal] = self.total;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:@(self.count) forKey:kOrderCellModelCount];	if(self.goodsName != nil){
		[aCoder encodeObject:self.goodsName forKey:kOrderCellModelGoodsName];
	}
	[aCoder encodeObject:@(self.paymentTradeStatus) forKey:kOrderCellModelPaymentTradeStatus];	if(self.pic != nil){
		[aCoder encodeObject:self.pic forKey:kOrderCellModelPic];
	}
	if(self.shopname != nil){
		[aCoder encodeObject:self.shopname forKey:kOrderCellModelShopname];
	}
	if(self.size != nil){
		[aCoder encodeObject:self.size forKey:kOrderCellModelSize];
	}
	[aCoder encodeObject:@(self.status) forKey:kOrderCellModelStatus];	if(self.time != nil){
		[aCoder encodeObject:self.time forKey:kOrderCellModelTime];
	}
	if(self.total != nil){
		[aCoder encodeObject:self.total forKey:kOrderCellModelTotal];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.count = [[aDecoder decodeObjectForKey:kOrderCellModelCount] integerValue];
	self.goodsName = [aDecoder decodeObjectForKey:kOrderCellModelGoodsName];
	self.paymentTradeStatus = [[aDecoder decodeObjectForKey:kOrderCellModelPaymentTradeStatus] integerValue];
	self.pic = [aDecoder decodeObjectForKey:kOrderCellModelPic];
	self.shopname = [aDecoder decodeObjectForKey:kOrderCellModelShopname];
	self.size = [aDecoder decodeObjectForKey:kOrderCellModelSize];
	self.status = [[aDecoder decodeObjectForKey:kOrderCellModelStatus] integerValue];
	self.time = [aDecoder decodeObjectForKey:kOrderCellModelTime];
	self.total = [aDecoder decodeObjectForKey:kOrderCellModelTotal];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	OrderCellModel *copy = [OrderCellModel new];

	copy.count = self.count;
	copy.goodsName = [self.goodsName copy];
	copy.paymentTradeStatus = self.paymentTradeStatus;
	copy.pic = [self.pic copy];
	copy.shopname = [self.shopname copy];
	copy.size = [self.size copy];
	copy.status = self.status;
	copy.time = [self.time copy];
	copy.total = [self.total copy];

	return copy;
}
@end