//
//  MeTableHeader.m
//  BasicFramework
//
//  Created by mr_right on 16/9/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "MeTableHeader.h"
#import "ChargeViewController.h"
#import "TiXianViewController.h"
@interface MeTableHeader ()
@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *userDesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImgV;



@end

@implementation MeTableHeader

+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

- (IBAction)tixianAction:(id)sender {
    
    UINavigationController *nav= (UINavigationController*)[NSObject viewControllerWithviewObj:self].navigationController;
    TiXianViewController *vc=[[TiXianViewController alloc] init];
    [nav pushViewController:vc animated:YES];
    
}
- (IBAction)chongzhiAction:(id)sender {
    UINavigationController *nav= (UINavigationController*)[NSObject viewControllerWithviewObj:self].navigationController;
    ChargeViewController *vc=[[ChargeViewController alloc] init];
    [nav pushViewController:vc animated:YES];

}


@end
