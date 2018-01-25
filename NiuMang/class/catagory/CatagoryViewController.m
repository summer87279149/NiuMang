//
//  CatagoryViewController.m
//  NiuMang
//
//  Created by Admin on 2017/10/8.
//  Copyright © 2017年 Summer. All rights reserved.
//
#import "GoodsDetailViewController.h"
#import "HomeCellModel.h"
#import "CatagoryViewController.h"
#import "CatagoryCollectionViewCell.h"

@interface CatagoryViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property (nonatomic, strong) NSMutableArray *allDataArr;
@property (nonatomic, strong) NSMutableArray *pickArr;
@property (nonatomic, strong) NSMutableArray *displayArr;
@end

@implementation CatagoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [RequestManager cataRequestSuccess:^(id response) {
        self.allDataArr = response;
        for (NSDictionary*dic in self.allDataArr) {
            [self.pickArr  addObject: dic[@"cate_name"]];
        }
        self.displayArr = self.allDataArr[0][@"data"];
        [self.tableview reloadData];
        [self.collectionview reloadData];
        
        
    } error:^(id response) {
        
    }];
}
- (IBAction)btnClicked:(UIButton *)sender {
    
}


//MARK: - tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor whiteColor];
    if (indexPath.row != 0) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
        cell.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        cell.textLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    
    self.displayArr = self.allDataArr[indexPath.row][@"data"];
    [self.collectionview reloadData];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.pickArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *tableCell = @"CellIdentifier";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableCell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:tableCell];
        cell.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        if (indexPath.row==0) {
            cell.contentView.backgroundColor = [UIColor whiteColor];
        }
    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (self.pickArr.count) {
        cell.textLabel.text = self.pickArr[indexPath.row];
    }
    return cell;
}

//MARK: - collectionView delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.displayArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CatagoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    if (self.displayArr.count>0) {
        NSDictionary*dic = self.displayArr[indexPath.row];
        cell.nameLabel.text = dic[@"goods_name"];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://srdb.yzszsf.com/static/goodsimage/%@",dic[@"pic"]]]];
    }
  
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"collection当前点击:%ld",indexPath.row);
    NSDictionary *model = self.displayArr[indexPath.row];
    GoodsDetailViewController*vc = [[GoodsDetailViewController alloc]init];
    vc.goodID = [NSString stringWithFormat:@"%@",model[@"id"]];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth*0.75/3-20, (kScreenWidth*0.75/3-20)*105/76);
}

-(NSMutableArray*)pickArr{
    if(!_pickArr){
        _pickArr = [NSMutableArray array];
//        _pickArr = @[@"水果一",@"农产品",@"农产品测试啊"];
    }
    return _pickArr;
}

-(NSMutableArray*)displayArr{
    if(!_displayArr){
        _displayArr = [NSMutableArray array];
//        _displayArr = @[@"水果一",@"农产品",@"农产品测试啊",@"水果一",@"农产品",@"农产品测试啊"];
    }
    return _displayArr;
}
-(NSMutableArray*)allDataArr{
    if(!_allDataArr){
        _allDataArr = [NSMutableArray array];
    }
    return _allDataArr;
}
/*
#prag
 ma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
