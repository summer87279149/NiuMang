//
//  BaseViewController.m
//  Driver
//
//  Created by Admin on 17/2/13.
//  Copyright © 2017年 Admin. All rights reserved.
//
//#import "BackgroundContainerView.h"
#import "FeHandwriting.h"
#import "BaseViewController.h"
//#import "UserLoginViewController.h"
#import "BaseNavViewController.h"
@interface BaseViewController ()
{
    CGRect keyboardRect;
    CGFloat distance;
    BOOL isTransform;
}
//@property (nonatomic, assign) CGPoint orginalPoint;
@property (strong, nonatomic) FeHandwriting *handwritingLoader;
//@property (strong, nonatomic) BackgroundContainerView *containerView;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    isTransform = NO;
    
    
}

#pragma mark - 网络加载动画
//-(BackgroundContainerView*)containerView{
//    if(!_containerView){
//        _containerView = [[BackgroundContainerView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
////        _containerView.backgroundColor = [UIColor jk_colorWithHexString:@"FEA101"];
//    }
//    return _containerView;
//}
//-(void)startLoadingAnimation{
//    [self.view addSubview:self.containerView];
//    [self.view bringSubviewToFront:self.containerView];
//    _handwritingLoader = [[FeHandwriting alloc] initWithView:self.containerView];
//    [self.view addSubview:_handwritingLoader];
//    [_handwritingLoader show];
//}
//-(void)stopLoadingAnimation{
//    [_handwritingLoader dismiss];
//    [UIView animateWithDuration:0.2 animations:^{
//        [_handwritingLoader removeFromSuperview];
//        [self.containerView removeFromSuperview];
//    }];
//}


#pragma mark - 键盘
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(OtherAddressLogin) name:OtherAddressLogin object:nil];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [self.view resignFirstResponder];
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIView *firstResponder = [keyWindow performSelector:@selector(firstResponder)];
    CGRect frame;
//    if ([firstResponder isKindOfClass: [UIViewController class]]) {
//        frame = (CGRect)[[firstResponder valueForKey:@"view"]valueForKey:@"frame"];
//    }else{
//
//    }
    frame = firstResponder.frame;
    CGRect rectInVC = [firstResponder convertRect:frame toView:self.view];
    CGFloat finalYOffeset = rectInVC.origin.y+rectInVC.size.height;
//    NSLog(@"第一相应对象是:%@,frame是:%@",firstResponder,NSStringFromCGRect(rectInVC));
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    NSDictionary *info = [notification userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    keyboardRect = [value CGRectValue];
    distance = keyboardRect.origin.y - finalYOffeset;
//    NSLog(@"distance = keyboardRect.origin.y - finalYOffeset是\n %f = %f - %f",distance,keyboardRect.origin.y,finalYOffeset);
    if (distance<0) {
        [UIView animateWithDuration:duration animations:^{
//            self.view.transform = CGAffineTransformMakeTranslation(0, -fabs(distance)-20);
            self.view.frame = CGRectMake(0, -fabs(distance)-50, kScreenWidth, kScreenHeight);
        } completion:^(BOOL finished) {
            isTransform = YES;
        }];
    }
    
}
-(void)dealWithResponse:(id)response success:(void(^)())success{
    NSString *code = response[@"code"];
    NSString *message = response[@"message"];
    if ([code intValue]==1) {
        success();
    }else{
//        [MBProgressHUD showError:message];
    }
}
-(void)keyBoardWillHide:(NSNotification *)notification{
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    if (isTransform) {
        [UIView animateWithDuration:duration animations:^{
//            self.view.transform = CGAffineTransformTranslate(self.view.transform, 0, fabs(distance)+20);
            self.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);

        } completion:^(BOOL finished) {
            isTransform = NO;
        }];
    }
//    self.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenWidth);
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - DZNEmptyDataSetSource
-(NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    
    NSString *text = @"无结果";
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0f],
                                 NSForegroundColorAttributeName: [UIColor darkGrayColor]};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = @"此处没有找到记录";
    
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}



@end
