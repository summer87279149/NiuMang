//
//	HomeCellModel.m
//
//	Create by summer on 6/1/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "HomeCellModel.h"

NSString *const kHomeCellModelCateName = @"cate_name";
NSString *const kHomeCellModelCid = @"cid";
NSString *const kHomeCellModelDescriptionField = @"description";
NSString *const kHomeCellModelGid = @"gid";
NSString *const kHomeCellModelGoodsName = @"goods_name";
NSString *const kHomeCellModelPic = @"pic";
NSString *const kHomeCellModelPrice = @"price";

@interface HomeCellModel ()
@end
@implementation HomeCellModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kHomeCellModelCateName] isKindOfClass:[NSNull class]]){
		self.cateName = dictionary[kHomeCellModelCateName];
	}	
	if(![dictionary[kHomeCellModelCid] isKindOfClass:[NSNull class]]){
		self.cid = [dictionary[kHomeCellModelCid] integerValue];
	}

	if(![dictionary[kHomeCellModelDescriptionField] isKindOfClass:[NSNull class]]){
		self.descriptionField = dictionary[kHomeCellModelDescriptionField];
	}	
	if(![dictionary[kHomeCellModelGid] isKindOfClass:[NSNull class]]){
		self.gid = [dictionary[kHomeCellModelGid] integerValue];
	}

	if(![dictionary[kHomeCellModelGoodsName] isKindOfClass:[NSNull class]]){
		self.goodsName = dictionary[kHomeCellModelGoodsName];
	}	
	if(![dictionary[kHomeCellModelPic] isKindOfClass:[NSNull class]]){
		self.pic = dictionary[kHomeCellModelPic];
	}	
	if(![dictionary[kHomeCellModelPrice] isKindOfClass:[NSNull class]]){
		self.price = dictionary[kHomeCellModelPrice];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.cateName != nil){
		dictionary[kHomeCellModelCateName] = self.cateName;
	}
	dictionary[kHomeCellModelCid] = @(self.cid);
	if(self.descriptionField != nil){
		dictionary[kHomeCellModelDescriptionField] = self.descriptionField;
	}
	dictionary[kHomeCellModelGid] = @(self.gid);
	if(self.goodsName != nil){
		dictionary[kHomeCellModelGoodsName] = self.goodsName;
	}
	if(self.pic != nil){
		dictionary[kHomeCellModelPic] = self.pic;
	}
	if(self.price != nil){
		dictionary[kHomeCellModelPrice] = self.price;
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
	if(self.cateName != nil){
		[aCoder encodeObject:self.cateName forKey:kHomeCellModelCateName];
	}
	[aCoder encodeObject:@(self.cid) forKey:kHomeCellModelCid];	if(self.descriptionField != nil){
		[aCoder encodeObject:self.descriptionField forKey:kHomeCellModelDescriptionField];
	}
	[aCoder encodeObject:@(self.gid) forKey:kHomeCellModelGid];	if(self.goodsName != nil){
		[aCoder encodeObject:self.goodsName forKey:kHomeCellModelGoodsName];
	}
	if(self.pic != nil){
		[aCoder encodeObject:self.pic forKey:kHomeCellModelPic];
	}
	if(self.price != nil){
		[aCoder encodeObject:self.price forKey:kHomeCellModelPrice];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.cateName = [aDecoder decodeObjectForKey:kHomeCellModelCateName];
	self.cid = [[aDecoder decodeObjectForKey:kHomeCellModelCid] integerValue];
	self.descriptionField = [aDecoder decodeObjectForKey:kHomeCellModelDescriptionField];
	self.gid = [[aDecoder decodeObjectForKey:kHomeCellModelGid] integerValue];
	self.goodsName = [aDecoder decodeObjectForKey:kHomeCellModelGoodsName];
	self.pic = [aDecoder decodeObjectForKey:kHomeCellModelPic];
	self.price = [aDecoder decodeObjectForKey:kHomeCellModelPrice];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	HomeCellModel *copy = [HomeCellModel new];

	copy.cateName = [self.cateName copy];
	copy.cid = self.cid;
	copy.descriptionField = [self.descriptionField copy];
	copy.gid = self.gid;
	copy.goodsName = [self.goodsName copy];
	copy.pic = [self.pic copy];
	copy.price = [self.price copy];

	return copy;
}
@end