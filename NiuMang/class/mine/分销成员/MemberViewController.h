//
//  MemberViewController.h
//  NiuMang
//
//  Created by mc on 2018/1/24.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "BaseViewController.h"
typedef NS_ENUM(NSUInteger,MemberLevel){
    MemberLevelOne,
    MemberLevelTwo,
    MemberLevelThree
};
@interface MemberViewController : BaseViewController
@property (nonatomic, assign) MemberLevel memberLevel;
@end
