//
//  MineViewController.m
//  NiuMang
//
//  Created by Admin on 2017/10/8.
//  Copyright © 2017年 Summer. All rights reserved.
//



#import "MoneyViewController.h"
#import "ShareMemberViewController.h"
#import "ShareViewController.h"
#import "AddInfoViewController.h"
#import "MyOrderViewController.h"
#import "JiFenViewController.h"
#import "FeedbackViewController.h"
#import "MineViewController.h"
//#import "FeedBackViewController.h"
#import "WalletViewController.h"
@interface MineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSArray *cellArr;
@property (weak, nonatomic) IBOutlet UIImageView *portrait;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if([UserModel userId]){
        [RequestManager getPortraitSuccess:^(id response) {
            if([response[@"status"]integerValue]==1){
                [self.portrait sd_setImageWithURL:[NSURL URLWithString:response[@"retdata"][@"heard"]] placeholderImage:[UIImage imageNamed:@"timg.jpeg"]];
                self.name.text = response[@"retdata"][@"name"];
                [UserModel shareManager].userName = response[@"retdata"][@"name"];
                [UserModel shareManager].portrait = response[@"retdata"][@"heard"];
            }
        } error:^(id response) {
            
        }];
    }else{
//        [self  presentViewController:[DengRuViewController new]  animated:YES completion:nil];
    }
}
//MARK: - btn clicked
- (IBAction)feedback:(UIButton *)sender {
    [self.navigationController pushViewController:[FeedbackViewController new] animated:YES];
}
- (IBAction)jifen:(UIButton *)sender {
    [self.navigationController pushViewController:[JiFenViewController new] animated:YES];
}




//MARK: - collectionView delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  6;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item2" forIndexPath:indexPath];
    cell.layer.cornerRadius = 10;
    UIImageView *imgView = [cell viewWithTag:1001];
    imgView.image = [UIImage imageNamed:self.cellArr[indexPath.row]];
//    imgView.layer.cornerRadius = (kScreenWidth/3-20)/2/2/4;
//    imgView.layer.masksToBounds = YES;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"collection当前点击:%ld",indexPath.row);
    switch (indexPath.row) {
        case 0:{
            WalletViewController *vc = [[WalletViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:{
            MyOrderViewController *vc = [[MyOrderViewController alloc]init];

            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:{
             AddInfoViewController *vc = [[AddInfoViewController alloc]init];
            

            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:{
            ShareViewController *vc = [[ShareViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:{
           ShareMemberViewController *vc = [[ShareMemberViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:{
            MoneyViewController *vc = [[MoneyViewController  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}
- (CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(kScreenWidth/3-4, (kScreenWidth/3)-4);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSArray*)cellArr{
    if(!_cellArr){
        _cellArr = @[@"1",@"2",@"3",@"4",@"5",@"6"];
    }
    return _cellArr;
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

