


//
//  ShareMemberViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//
#import "MemberViewController.h"
#import "ShareMemberViewController.h"

@interface ShareMemberViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *portrait;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;

@property (weak, nonatomic) IBOutlet UIButton *oneLevelMenber;


@end

@implementation ShareMemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分销成员";
    self.portrait.layer.cornerRadius = 35;
    self.portrait.layer.masksToBounds = YES;
    SHOWHUD
    self.name.text =  [UserModel shareManager].userName;
    [self.portrait sd_setImageWithURL:[NSURL URLWithString:[UserModel shareManager].portrait] placeholderImage:[UIImage imageNamed:@"timg.jpeg"]];
    [RequestManager getFenXiaoChengYuanSuccess:^(id response) {
       HIDEHUD
        if([response[@"status"]integerValue]==1){
            _one.text = [NSString stringWithFormat:@"%@人 >",response[@"retdata"][@"one"]];
            _two.text = [NSString stringWithFormat:@"%@人 >",response[@"retdata"][@"two"]];
            _three.text = [NSString stringWithFormat:@"%@人 >",response[@"retdata"][@"three"]];
        }
    } error:^(id response) {
        HIDEHUD
    }];
}
- (IBAction)oneLevelMember:(UIButton *)sender {
    MemberViewController *vc = [MemberViewController new];
    vc.memberLevel = MemberLevelOne;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)twoLevelMember:(UIButton *)sender {
    MemberViewController *vc = [MemberViewController new];
    vc.memberLevel = MemberLevelTwo;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)threeLevelMember:(UIButton *)sender {
    MemberViewController *vc = [MemberViewController new];
    vc.memberLevel = MemberLevelThree;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
