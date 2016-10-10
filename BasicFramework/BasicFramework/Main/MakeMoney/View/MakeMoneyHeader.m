//
//  MakeMoneyHeader.m
//  BasicFramework
//
//  Created by mr_right on 16/9/29.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "MakeMoneyHeader.h"
#import "PublishViewController.h"
@implementation MakeMoneyHeader

+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
-(void)awakeFromNib{
    [super awakeFromNib];
    
    
}

- (IBAction)publishAction:(id)sender {
    
  UINavigationController *nav=  [NSObject viewControllerWithviewObj:self].navigationController;
   PublishViewController *vc= [PublishViewController new];
//    [vc setHidesBottomBarWhenPushed:YES];
    [nav pushViewController:vc animated:YES];
}

@end
