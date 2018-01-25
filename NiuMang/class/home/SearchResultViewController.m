//
//  SearchResultViewController.m
//  NiuMang
//
//  Created by mc on 2018/1/24.
//  Copyright © 2018年 Summer. All rights reserved.
//
#import "SearchModel.h"
#import "SearchCollectionViewCell.h"
#import "GoodsDetailViewController.h"
#import "HomeCellModel.h"
#import "SearchResultViewController.h"
#import "HomeCollectionViewCell.h"
@interface SearchResultViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (strong, nonatomic)  UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *cellArr;


@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索结果";
    self.cellArr = [NSMutableArray array];
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
    SHOWHUD
    [RequestManager search:self.searchKey success:^(id response) {
        HIDEHUD;
        if([response[@"status"]integerValue]==1){
            NSArray*arr = response[@"retdata"];
            for (NSDictionary*dic in arr) {
                SearchModel *model = [[SearchModel alloc]initWithDictionary:dic];
                [self.cellArr addObject:model];
            }
            [self.collectionView reloadData];
        }
    } error:^(id response) {
        HIDEHUD;
    }];
}
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        CGFloat y = 64;
        if(iPhoneX){
            y = 88;
        }
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        // 设置collectionView的滚动方向，需要注意的是如果使用了collectionview的headerview或者footerview的话， 如果设置了水平滚动方向的话，那么就只有宽度起作用了了
//        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
         layout.minimumInteritemSpacing = 0;// 垂直方向的间距
         layout.minimumLineSpacing = 0; // 水平方向的间距
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.emptyDataSetSource = self;
        _collectionView.emptyDataSetDelegate = self;
        _collectionView.frame = CGRectMake(0, y, kScreenWidth, kScreenHeight-y);
        [_collectionView registerNib:[UINib nibWithNibName:@"SearchCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.cellArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    SearchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        
    }
    cell.model = self.cellArr[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SearchModel *model = self.cellArr[indexPath.row];
    GoodsDetailViewController*vc = [[GoodsDetailViewController alloc]init];
    vc.goodID = [NSString stringWithFormat:@"%ld",(long)model.idField];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth/2, kScreenWidth/2);
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
    NSString *text = @"没搜到东西哦";
    
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
