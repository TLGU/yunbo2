//
//  RootViewController.m
//  Dome
//
//  Created by Rainy on 16/8/18.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "RootViewController.h"
#import "YSLContainerViewController.h"
@interface RootViewController ()<YSLContainerViewControllerDelegate>
    
    @end

@implementation RootViewController
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *vc1=[UIViewController new];vc1.title=@"影视";
    UIViewController *vc2=[UIViewController new];vc2.title=@"VR";
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[vc1,vc2]
                                                                                        topBarHeight:20
                                                                                parentViewController:self];
    containerVC.menuItemSelectedTitleColor=kThemeColor;
    
    containerVC.menuIndicatorColor=kRGB(89, 89, 89);
    containerVC.menuItemTitleColor=[UIColor grayColor];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:18];
    
    [self.view addSubview:containerVC.view];
    [self containerViewItemIndex:0 currentController:vc1];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:LoginStatus_Changed object:nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
   

}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
        
        
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=NO;
}
    

    
    
    
    
    
    
    @end
