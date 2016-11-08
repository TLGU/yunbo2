//
//  VRViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/10/18.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "VRViewController.h"

@interface VRViewController ()

@end

@implementation VRViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.collectionView.contentInset=UIEdgeInsetsMake(0, 0, 49+64, 0);
    
    self.collectionView.scrollIndicatorInsets=self.collectionView.contentInset;
    
}





@end
