//
//  MyOrderViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//
#import "OrderCellModel.h"
#import "MyOrderTableViewCell.h"
#import "MyOrderViewController.h"

@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *cellArr;
@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    self.cellArr = [NSMutableArray array];
    SHOWHUD
    [RequestManager queryOrderWithUid:[UserModel userId] success:^(id response) {
        NSLog(@"%@",response);
        if ([response[@"status"] integerValue]==1) {
            NSArray*arr = response[@"retdata"][@"list"];
            for (NSDictionary*dic in arr) {
                OrderCellModel *model = [[OrderCellModel alloc]initWithDictionary:dic];
                [self.cellArr addObject:model];
            }
            [self.tableview reloadData];
        }
        HIDEHUD
    } error:^(id response) {
        HIDEHUD
    }];
    [self.view addSubview: self.tableview];
}
-(UITableView*)tableview{
    
    if(!_tableview){
        CGFloat y = 64;
        if(iPhoneX){
            y = 88;
        }
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-y) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [UIView new];
        [_tableview registerNib:[UINib nibWithNibName:@"MyOrderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MyOrderTableViewCellID"];
        _tableview.estimatedRowHeight = 130;
        _tableview.rowHeight = UITableViewAutomaticDimension;
        
    }
    return _tableview;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyOrderTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"MyOrderTableViewCellID" forIndexPath:indexPath];
    WS(weakSelf)
    cell.buyBlock = ^{
      //去支付
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.cellArr.count>0) {
        cell.model = self.cellArr[indexPath.row];
//        NSLog(@"cell.model=%@",cell.model);
    }
    return cell;
}
@end
