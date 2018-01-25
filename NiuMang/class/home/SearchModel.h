//
//	SearchModel.h
//
//	Create by summer on 24/1/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface SearchModel : NSObject

@property (nonatomic, assign) NSInteger cateId;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, strong) NSString * freight;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, assign) NSInteger isOnsale;
@property (nonatomic, assign) NSInteger mid;
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * size;
@property (nonatomic, assign) NSInteger store;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end