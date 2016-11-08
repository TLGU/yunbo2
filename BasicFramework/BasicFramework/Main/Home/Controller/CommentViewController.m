//
//  CommentViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/10/18.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.contentInset=UIEdgeInsetsMake(0, 0, 49+64, 0);
    self.collectionView.scrollIndicatorInsets=self.collectionView.contentInset;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
