//
//  MyOrderTableViewCell.h
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//
#import "OrderCellModel.h"
#import <UIKit/UIKit.h>
typedef void(^BuyBlock)();
@interface MyOrderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *fahuo;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *numbers;
@property (weak, nonatomic) IBOutlet UILabel *totalprice;
@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (nonatomic, copy) BuyBlock buyBlock;
@property (nonatomic, strong) OrderCellModel *model;
@end
