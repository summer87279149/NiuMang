//
//	HomeCellModel.h
//
//	Create by summer on 6/1/2018
//	Copyright © 2018. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface HomeCellModel : NSObject

@property (nonatomic, strong) NSString * cateName;
@property (nonatomic, assign) NSInteger cid;
@property (nonatomic, strong) NSString * descriptionField;
@property (nonatomic, assign) NSInteger gid;
@property (nonatomic, strong) NSString * goodsName;
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) NSString * price;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end