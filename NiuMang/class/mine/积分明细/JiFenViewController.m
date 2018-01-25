


//
//  JiFenViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//
#import "RuleViewController.h"
#import "JiFenViewController.h"

@interface JiFenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *jiFen;

@end

@implementation JiFenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"积分";
    SHOWHUD
    [RequestManager getJiFenSuccess:^(id response) {
        
        if([response[@"status"]integerValue]==1){
            HIDEHUD
            self.jiFen.text = [NSString stringWithFormat:@"当前%@积分",response[@"retdata"][@"integral"]];
        }
    } error:^(id response) {
        HIDEHUD
        [MBProgressHUD showError:@"网络错误"];
    }];

}
- (IBAction)rule:(UIButton *)sender {
    [self.navigationController pushViewController: [RuleViewController new] animated:YES];
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
