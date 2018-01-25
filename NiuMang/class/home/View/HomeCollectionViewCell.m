//
//  HomeCollectionViewCell.m
//  NiuMang
//
//  Created by mc on 2018/1/6.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell
-(void)awakeFromNib{
    [super awakeFromNib];
    
}
-(void)setModel:(HomeCellModel *)model{
    _model = model;
    self.imgView.layer.cornerRadius = 3;
    self.imgView.layer.masksToBounds = YES;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://srdb.yzszsf.com/static/goodsimage/%@",model.pic]]];
    self.name.text = model.goodsName;
    self.price.text = [NSString stringWithFormat:@"¥%@",model.price];
    
}
@end
