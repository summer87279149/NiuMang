
//
//  BindBankViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "BindBankViewController.h"

@interface BindBankViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *cardNumber;
@property (weak, nonatomic) IBOutlet UITextField *bankName;
@property (weak, nonatomic) IBOutlet UITextField *phone;

@end

@implementation BindBankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"绑定银行卡";
    SHOWHUD
    [RequestManager getBindBankInfoSuccess:^(id response) {
        HIDEHUD
        if([response[@"status"]integerValue]==1){
            self.name.text = response[@"retdata"][@"name"];
            self.phone.text = response[@"retdata"][@"tel"];
            self.bankName.text = response[@"retdata"][@"owner"];
            self.cardNumber.text = response[@"retdata"][@"cardnum"];
        }
    } error:^(id response) {
        HIDEHUD
    }];
}
- (IBAction)confirm:(UIButton *)sender {
    if (self.name.text.length==0||self.cardNumber.text.length==0||self.bankName.text.length==0||self.phone.text.length==0) {
        [MBProgressHUD showError:@"信息填写有误"];
        return;
    }
    SHOWHUD
    [RequestManager bindBankWith:self.name.text andCardNumber:self.cardNumber.text andOwner:self.bankName.text andPhone:self.phone.text success:^(id response) {
        HIDEHUD
        [MBProgressHUD showSuccess:@"OK"];
      
    } error:^(id response) {
        HIDEHUD
       [MBProgressHUD showError:@"网络错误" toView:self.view];
    }];
}


@end
