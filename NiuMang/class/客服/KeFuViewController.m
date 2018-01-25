

//
//  KeFuViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/7.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "KeFuViewController.h"

@interface KeFuViewController ()
@property (weak, nonatomic) IBOutlet UIButton *maskBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation KeFuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"客服";
    self.imgView.layer.cornerRadius = 3;
}
- (IBAction)btnClicked:(id)sender {
    self.maskBtn.hidden = !self.maskBtn.hidden;
    self.imgView.hidden = !self.imgView.hidden;
}
- (IBAction)maskBtnClicked:(UIButton *)sender {
    sender.hidden = YES;
    self.imgView.hidden = YES;
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
