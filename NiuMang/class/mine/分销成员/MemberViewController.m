
//
//  MemberViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/24.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import "MemberViewController.h"

@interface MemberViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableArray *cellArr;
@end

@implementation MemberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"成员";
    
    [self.view addSubview:self.tableview];
    SHOWHUD
    switch (self.memberLevel) {
        case MemberLevelOne:{
            [RequestManager getLevelOneMembersSuccess:^(id response) {
                HIDEHUD
                if([response[@"status"]integerValue]==1){
                    NSArray*arr = response[@"retdata"];
                    for (NSDictionary*dic in arr) {
                        [self.cellArr addObject:dic];
                    }
                    [self.tableview reloadData];
                }
            } error:^(id response) {
                HIDEHUD
            }];
        }
            break;
        case MemberLevelTwo:{
            [RequestManager getLevelTwoMembersSuccess:^(id response) {
                HIDEHUD
                if([response[@"status"]integerValue]==1){
                    NSArray*arr = response[@"retdata"];
                    for (NSDictionary*dic in arr) {
                        [self.cellArr addObject:dic];
                    }
                    [self.tableview reloadData];
                }
            } error:^(id response) {
                HIDEHUD
            }];
        }
            break;
        case MemberLevelThree:{
            [RequestManager getLevelThreeMembersSuccess:^(id response) {
                HIDEHUD
                if([response[@"status"]integerValue]==1){
                    NSArray*arr = response[@"retdata"];
                    for (NSDictionary*dic in arr) {
                        [self.cellArr addObject:dic];
                    }
                    [self.tableview reloadData];
                }
            } error:^(id response) {
                HIDEHUD
            }];
        }
            break;
        default:
            break;
    }
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cellArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCell = @"CellIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:tableCell];
    }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.cellArr.count) {
        cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.cellArr[indexPath.row][@"heard"]] placeholderImage:[UIImage imageNamed:@"timg.jpeg"]];
        cell.textLabel.text = self.cellArr[indexPath.row][@"name"];
    }
    
    return cell;
}

-(UITableView*)tableview{
    if(!_tableview){
        CGFloat y = 64;
        if(iPhoneX){
            y = 88;
        }
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, y, kScreenWidth, kScreenHeight-y) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
//        _tableview.tableHeaderView = <#headerview#>;
        _tableview.tableFooterView = [UIView new];
//        [_tableview registerNib:[UINib nibWithNibName:<#nibName#> bundle:[NSBundle mainBundle]] forCellReuseIdentifier:<#identifier#>];
//        _tableview.estimatedRowHeight = 130;
//        _tableview.rowHeight = UITableViewAutomaticDimension;
//        [_tableview addHeaderWithTarget:self action:@selector(<#headRequest#>)];
//        [_tableview addFooterWithTarget:self action:@selector(<#footRequest#>)];
        _tableview.emptyDataSetSource = self;
        _tableview.emptyDataSetDelegate = self;
    }
    return _tableview;
}
-(NSMutableArray*)cellArr{
    if(!_cellArr){
        _cellArr = [NSMutableArray array];
    }
    return _cellArr;
}
#pragma mark - DZNEmptyDataSetSource

-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *text = @"没有数据";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"还没有成员哦";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    
}


@end
