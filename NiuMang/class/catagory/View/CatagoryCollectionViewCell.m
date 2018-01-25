//
//  CatagoryCollectionViewCell.m
//  NiuMang
//
//  Created by mc on 2018/1/7.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "CatagoryCollectionViewCell.h"

@implementation CatagoryCollectionViewCell
-(void)awakeFromNib{
    [super awakeFromNib];
    self.imgView.layer.cornerRadius = 3;
    self.imgView.layer.masksToBounds = YES;
}
@end
