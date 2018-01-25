//
//  BuyDetailView.h
//  NiuMang
//
//  Created by mc on 2018/1/23.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyDetailView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *shengYu;
@property (weak, nonatomic) IBOutlet UITextField *nums;
@property (weak, nonatomic) IBOutlet UIButton *desBtn;
@property (weak, nonatomic) IBOutlet UIButton *incBtn;

@end
