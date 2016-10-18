//
//  HomeCollectionViewHeader.m
//  BasicFramework
//
//  Created by mr_right on 16/10/17.
//  Copyright © 2016年 Rainy. All rights reserved.
//
#define adViewHeight ((kScreenHeight-49)/2.0f)-130)

#define pageControlCenx kScreenWidth/2.0f

#import "HomeCollectionViewHeader.h"

#import "HWAutoScrollView.h"

@interface HomeCollectionViewHeader ()

@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (weak, nonatomic) IBOutlet UIView *rightView;

@property(strong,nonatomic)UITextField *textField;

@property (strong, nonatomic) IBOutlet UIView *adView;

@end

@implementation HomeCollectionViewHeader

- (IBAction)saixuanAction:(id)sender {
    
}


- (void)awakeFromNib
{
    
    [super awakeFromNib];
    
    [self.leftView setCornerRad:20];
    [self.rightView setCornerRad:20];
    
    [self createControlByRemoteImage];
    
}

#pragma mark - 根据远程图片创建轮播视图
- (void)createControlByRemoteImage
{
    NSArray *imageUrlArray = @[@"http://pic24.nipic.com/20121003/10754047_140022530392_2.jpg", @"http://img15.3lian.com/2015/a1/13/d/17.jpg", @"http://pic36.nipic.com/20131022/7786988_135813187182_2.jpg"];
    HWAutoScrollView *view = [[HWAutoScrollView alloc] initWithImageUrlArray:imageUrlArray placeHolder:@"loadingImage" imageOnClickCallBack:^(NSInteger imageIndex){
        NSLog(@"-->> RemoteImageIndex:%ld", (long)imageIndex);
    }];
    
    view.pageControlPosition = HWPageControlPositionCenter;
    view.imageViewContentMode = UIViewContentModeScaleAspectFill;
    [self.adView addSubview:view];
    
    __weak typeof(self) weakSelf = self;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(weakSelf.adView);
    }];
    
    
}
@end
