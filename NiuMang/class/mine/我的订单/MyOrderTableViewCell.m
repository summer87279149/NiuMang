//
//  MyOrderTableViewCell.m
//  NiuMang
//
//  Created by mc on 2018/1/16.
//  Copyright © 2018年 Summer. All rights reserved.
//
#import "NSDateFormatter+JKMake.h"
#import "MyOrderTableViewCell.h"

@implementation MyOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.buyBtn.layer.borderWidth = 1;
    self.buyBtn.layer.borderColor = [UIColor blackColor].CGColor;
    self.buyBtn.layer.cornerRadius = 5;
}
- (IBAction)goToBuy:(UIButton *)sender {
    if (self.buyBlock) {
        self.buyBlock(self);//这里传model
    }
}
-(void)setModel:(OrderCellModel *)model{
    _model = model;
    self.name.text = [NSString stringWithFormat:@"%@ %@ %@",model.shopname,model.paymentTradeStatus==0?@"未支付":@"已支付",[self timeWithTimeIntervalString:model.time]];
    
    if (model.paymentTradeStatus==0) {
        self.buyBtn.hidden = NO;
    }else{
        self.buyBtn.hidden = YES;
    }
    
    self.fahuo.text = model.status==0?@"未发货":@"已发货";
    self.weight.text = [NSString stringWithFormat:@"%@,%@",model.goodsName,model.size];
    self.numbers.text = [NSString stringWithFormat:@"共%ld件商品",(long)model.count];
    self.totalprice.text = [NSString stringWithFormat:@"合计:%@(含运费)",model.total];
    [self.img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://srdb.yzszsf.com/static/goodsimage/%@",model.pic]] placeholderImage:[UIImage imageNamed:@"timg.jpeg"]];
    
}
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
