//
//  WalletViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/8.
//  Copyright © 2018年 Summer. All rights reserved.
//
#import "BindBankViewController.h"
#import "WalletViewController.h"

@interface WalletViewController ()
@property (weak, nonatomic) IBOutlet UILabel *jifen;
@property (weak, nonatomic) IBOutlet UILabel *yuE;

@end

@implementation WalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"钱包";
    SHOWHUD
    
    [RequestManager getJiFenSuccess:^(id response) {
        if([response[@"status"]integerValue]==1){
            self.jifen.text = [NSString stringWithFormat:@"%@分",response[@"retdata"][@"integral"]];
        }
    } error:^(id response) {
    }];
    
    [RequestManager getRestMoneySuccess:^(id response) {
        if([response[@"status"]integerValue]==1){
            HIDEHUD
            self.yuE.text = [NSString stringWithFormat:@"%@元",response[@"retdata"][@"money"]];
        }
    } error:^(id response) {
        HIDEHUD
    }];
}
- (IBAction)bangDing:(UIButton *)sender {
    [self.navigationController pushViewController:[BindBankViewController new] animated:YES];
}
- (IBAction)tiXian:(UIButton *)sender {
    SHOWHUD
    [RequestManager tiXianSuccess:^(id response) {
        
        if([response[@"status"]integerValue]==1){
            [RequestManager confirmGetMoneySuccess:^(id response) {
                HIDEHUD
                [MBProgressHUD showSuccess:response[@"retdata"]];
                
            } error:^(id response) {
            }];
        }
    } error:^(id response) {
        HIDEHUD
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
