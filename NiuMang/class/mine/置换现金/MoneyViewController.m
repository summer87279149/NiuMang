//
//  MoneyViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "MoneyViewController.h"

@interface MoneyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *jifen;

@end

@implementation MoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"换现金";
    [self getJiFen];
    
}
-(void)getJiFen{
    SHOWHUD
    [RequestManager getJiFenSuccess:^(id response) {
        if([response[@"status"]integerValue]==1){
            HIDEHUD
            self.jifen.text = [NSString stringWithFormat:@"%@",response[@"retdata"][@"integral"]];
        }
    } error:^(id response) {
        HIDEHUD
        [MBProgressHUD showError:@"网络错误"];
    }];
}
- (IBAction)btnClicked:(UIButton *)sender {
    SHOWHUD
    [RequestManager getMoneySuccess:^(id response) {
        HIDEHUD
        if([response[@"status"]integerValue]==1){
            [self getJiFen];
            NSString*str = [NSString stringWithFormat:@"已提现%@元,请等待到账",response[@"retdata"][@"money"]];
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"OK" message:str preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
        }
    } error:^(id response) {
        HIDEHUD
    }];
}

@end
