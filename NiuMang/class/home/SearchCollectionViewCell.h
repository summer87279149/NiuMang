//
//  SearchCollectionViewCell.h
//  NiuMang
//
//  Created by mc on 2018/1/24.
//  Copyright © 2018年 Summer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellModel.h"
@interface SearchCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (nonatomic, strong) HomeCellModel *model;
@end