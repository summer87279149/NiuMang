//
//  BuyDetailView.m
//  NiuMang
//
//  Created by mc on 2018/1/23.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "BuyDetailView.h"

@implementation BuyDetailView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.incBtn.layer.cornerRadius = 2;
    self.incBtn.layer.borderWidth = 1;
    self.incBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.incBtn.layer.masksToBounds = YES;
    
    self.desBtn.layer.cornerRadius = 2;
    self.desBtn.layer.borderWidth = 1;
    self.desBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.desBtn.layer.masksToBounds = YES;
    
    self.nums.layer.cornerRadius = 2;
    self.nums.layer.borderWidth = 1;
    self.nums.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.nums.layer.masksToBounds = YES;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
