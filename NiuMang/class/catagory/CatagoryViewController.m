//
//  CatagoryViewController.m
//  NiuMang
//
//  Created by Admin on 2017/10/8.
//  Copyright © 2017年 Summer. All rights reserved.
//

#import "CatagoryViewController.h"

@interface CatagoryViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property (nonatomic, strong) NSArray *pickArr;
@property (nonatomic, strong) NSArray *displayArr;
@end

@implementation CatagoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//MARK: - tableview delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.backgroundColor = [UIColor whiteColor];
    if (indexPath.row != 0) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
       UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        cell.textLabel.backgroundColor = [UIColor lightGrayColor];
    }
    
    
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
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        if (indexPath.row==0) {
            cell.contentView.backgroundColor = [UIColor whiteColor];
        }
    }
    
    if (self.pickArr.count) {
        cell.textLabel.text = self.pickArr[indexPath.row];
    }
    return cell;
}

//MARK: - collectionView delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    return cell;
}
\
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"collection当前点击:%ld",indexPath.row);
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








-(NSArray*)pickArr{
    if(!_pickArr){
//        _pickArr = [NSMutableArray array];
        _pickArr = @[@"水果一",@"农产品",@"农产品测试啊"];
    }
    return _pickArr;
}
-(NSArray*)displayArr{
    if(!_displayArr){
        _displayArr = @[@"水果一",@"农产品",@"农产品测试啊",@"水果一",@"农产品",@"农产品测试啊"];
    }
    return _displayArr;
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
