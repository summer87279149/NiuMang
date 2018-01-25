//
//	SearchModel.m
//
//	Create by summer on 24/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "SearchModel.h"

NSString *const kSearchModelCateId = @"cate_id";
NSString *const kSearchModelDescriptionField = @"description";
NSString *const kSearchModelFreight = @"freight";
NSString *const kSearchModelGoodsName = @"goods_name";
NSString *const kSearchModelIdField = @"id";
NSString *const kSearchModelIsOnsale = @"is_onsale";
NSString *const kSearchModelMid = @"mid";
NSString *const kSearchModelPic = @"pic";
NSString *const kSearchModelPrice = @"price";
NSString *const kSearchModelSize = @"size";
NSString *const kSearchModelStore = @"store";

@interface SearchModel ()
@end
@implementation SearchModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kSearchModelCateId] isKindOfClass:[NSNull class]]){
		self.cateId = [dictionary[kSearchModelCateId] integerValue];
	}

	if(![dictionary[kSearchModelDescriptionField] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[kSearchModelDescriptionField];
	}	
	if(![dictionary[kSearchModelFreight] isKindOfClass:[NSNull class]]){
		self.freight = dictionary[kSearchModelFreight];
	}	
	if(![dictionary[kSearchModelGoodsName] isKindOfClass:[NSNull class]]){
		self.goodsName = dictionary[kSearchModelGoodsName];
	}	
	if(![dictionary[kSearchModelIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kSearchModelIdField] integerValue];
	}

	if(![dictionary[kSearchModelIsOnsale] isKindOfClass:[NSNull class]]){
		self.isOnsale = [dictionary[kSearchModelIsOnsale] integerValue];
	}

	if(![dictionary[kSearchModelMid] isKindOfClass:[NSNull class]]){
		self.mid = [dictionary[kSearchModelMid] integerValue];
	}

	if(![dictionary[kSearchModelPic] isKindOfClass:[NSNull class]]){
		self.pic = dictionary[kSearchModelPic];
	}	
	if(![dictionary[kSearchModelPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kSearchModelPrice];
	}	
	if(![dictionary[kSearchModelSize] isKindOfClass:[NSNull class]]){
		self.size = dictionary[kSearchModelSize];
	}	
	if(![dictionary[kSearchModelStore] isKindOfClass:[NSNull class]]){
		self.store = [dictionary[kSearchModelStore] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kSearchModelCateId] = @(self.cateId);
	if(self.descriptionField != nil){
		dictionary[kSearchModelDescriptionField] = self.descriptionField;
	}
	if(self.freight != nil){
		dictionary[kSearchModelFreight] = self.freight;
	}
	if(self.goodsName != nil){
		dictionary[kSearchModelGoodsName] = self.goodsName;
	}
	dictionary[kSearchModelIdField] = @(self.idField);
	dictionary[kSearchModelIsOnsale] = @(self.isOnsale);
	dictionary[kSearchModelMid] = @(self.mid);
	if(self.pic != nil){
		dictionary[kSearchModelPic] = self.pic;
	}
	if(self.price != nil){
		dictionary[kSearchModelPrice] = self.price;
	}
	if(self.size != nil){
		dictionary[kSearchModelSize] = self.size;
	}
	dictionary[kSearchModelStore] = @(self.store);
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
	[aCoder encodeObject:@(self.cateId) forKey:kSearchModelCateId];	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:kSearchModelDescriptionField];
	}
	if(self.freight != nil){
		[aCoder encodeObject:self.freight forKey:kSearchModelFreight];
	}
	if(self.goodsName != nil){
		[aCoder encodeObject:self.goodsName forKey:kSearchModelGoodsName];
	}
	[aCoder encodeObject:@(self.idField) forKey:kSearchModelIdField];	[aCoder encodeObject:@(self.isOnsale) forKey:kSearchModelIsOnsale];	[aCoder encodeObject:@(self.mid) forKey:kSearchModelMid];	if(self.pic != nil){
		[aCoder encodeObject:self.pic forKey:kSearchModelPic];
	}
	if(self.price != nil){
		[aCoder encodeObject:self.price forKey:kSearchModelPrice];
	}
	if(self.size != nil){
		[aCoder encodeObject:self.size forKey:kSearchModelSize];
	}
	[aCoder encodeObject:@(self.store) forKey:kSearchModelStore];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.cateId = [[aDecoder decodeObjectForKey:kSearchModelCateId] integerValue];
	self.descriptionField = [aDecoder decodeObjectForKey:kSearchModelDescriptionField];
	self.freight = [aDecoder decodeObjectForKey:kSearchModelFreight];
	self.goodsName = [aDecoder decodeObjectForKey:kSearchModelGoodsName];
	self.idField = [[aDecoder decodeObjectForKey:kSearchModelIdField] integerValue];
	self.isOnsale = [[aDecoder decodeObjectForKey:kSearchModelIsOnsale] integerValue];
	self.mid = [[aDecoder decodeObjectForKey:kSearchModelMid] integerValue];
	self.pic = [aDecoder decodeObjectForKey:kSearchModelPic];
	self.price = [aDecoder decodeObjectForKey:kSearchModelPrice];
	self.size = [aDecoder decodeObjectForKey:kSearchModelSize];
	self.store = [[aDecoder decodeObjectForKey:kSearchModelStore] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	SearchModel *copy = [SearchModel new];

	copy.cateId = self.cateId;
	copy.descriptionField = [self.descriptionField copy];
	copy.freight = [self.freight copy];
	copy.goodsName = [self.goodsName copy];
	copy.idField = self.idField;
	copy.isOnsale = self.isOnsale;
	copy.mid = self.mid;
	copy.pic = [self.pic copy];
	copy.price = [self.price copy];
	copy.size = [self.size copy];
	copy.store = self.store;

	return copy;
}
@end