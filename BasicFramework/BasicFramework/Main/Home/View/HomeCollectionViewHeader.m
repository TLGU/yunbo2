//
//  HomeCollectionViewHeader.m
//  BasicFramework
//
//  Created by mr_right on 16/10/17.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "HomeCollectionViewHeader.h"


@interface HomeCollectionViewHeader ()

@property (weak, nonatomic) IBOutlet UIView *leftView;

@property (weak, nonatomic) IBOutlet UIView *rightView;

@property(strong,nonatomic)UITextField *textField;

@end

@implementation HomeCollectionViewHeader

- (IBAction)saixuanAction:(id)sender {
    
}


- (void)awakeFromNib
{
    
    [super awakeFromNib];
    
    [self.leftView setCornerRad:20];
    [self.rightView setCornerRad:20];
    
    
    
}

@end
