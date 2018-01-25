


//
//  AddInfoViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "AddInfoViewController.h"

@interface AddInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *namelabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UIImageView *portraint;




@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *add;
@end

@implementation AddInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收件信息";
    SHOWHUD
    [RequestManager getAddressSuccess:^(id response) {
        if([response[@"status"]integerValue]==1){
         HIDEHUD
            self.namelabel.text =  [UserModel shareManager].userName;
            [self.portraint sd_setImageWithURL:[NSURL URLWithString:[UserModel shareManager].portrait] placeholderImage:[UIImage imageNamed:@"timg.jpeg"]];
            if (response[@"redata"]!=[NSNull null]&&response[@"redata"]!=nil) {
                self.add.text = response[@"redata"][@"address"];
                self.phone.text = response[@"redata"][@"phone"];
                self.name.text = response[@"redata"][@"rec"];
            }
        }
    } error:^(id response) {
//        HIDEHUD
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (IBAction)save:(id)sender {
    SHOWHUD
    NSDictionary*dic = @{@"uid":[UserModel userId],@"rec":self.name.text,@"address":self.add.text,@"phone":self.phone.text};
    [RequestManager editAddressWithPara:dic success:^(id response) {
        if([response[@"status"]integerValue]==1){
            HIDEHUD
            [MBProgressHUD showSuccess:@""];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } error:^(id response) {
        HIDEHUD
        [MBProgressHUD showError:@"网络有问题:("];
    }];
    
}

@end
