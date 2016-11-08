//
//  MeTableViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/9/26.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "MeTableViewController.h"
#import "MeTableHeader.h"
@interface MeTableViewController ()

@property(strong,nonatomic)NSMutableArray *meItems;

@property(strong,nonatomic)MeTableHeader *tableHeader;

@end
static NSString * reuseIdentifier=@"reuseIdentifier";
@implementation MeTableViewController
-(MeTableHeader *)tableHeader{
    if (!_tableHeader) {
        _tableHeader=[MeTableHeader header];
        [_tableHeader setFrame:CGRectMake(0, 0, kScreenWidth, 110)];
    }
    return _tableHeader;
}

-(NSMutableArray *)meItems
{
    if (!_meItems)
    {
        _meItems=[NSMutableArray arrayWithCapacity:2];
        NSMutableArray *itemArr0=[NSMutableArray array];
        NSMutableArray *itemArr1=[NSMutableArray arrayWithCapacity:7];
        [_meItems addObject:itemArr1];
        [_meItems addObject:itemArr0];
        for (int i=0; i<5; i++)
        {
            NSMutableDictionary *itemArr1Dic=[NSMutableDictionary dictionary];
            itemArr1Dic[@"icon"]=[NSString stringWithFormat:@"me_icon_%d",i];
            
            switch (i)
            {
                case 0:itemArr1Dic[@"title"]=@"会员升级";break;
//                case 1:itemArr1Dic[@"title"]=@"我的分享";break;
                case 1:itemArr1Dic[@"title"]=@"下载管理";break;
                case 2:itemArr1Dic[@"title"]=@"最近播放";break;
                case 3:itemArr1Dic[@"title"]=@"我的收藏";break;
                case 4:itemArr1Dic[@"title"]=@"现金流水";break;
                default:break;
            }
            [itemArr1 addObject:itemArr1Dic];
        }
        
        for (int i=0 ; i<2; i++)
        {
            NSMutableDictionary *itemArr1Dic=[NSMutableDictionary dictionary];
            itemArr1Dic[@"icon"]=[NSString stringWithFormat:@"me_icon2_%d",i];
            switch (i)
            {
                case 0:case 5:itemArr1Dic[@"title"]=@"设置";break;
                case 1:itemArr1Dic[@"title"]=@"帮助";break;
                default: break;
            }
            [itemArr0 addObject:itemArr1Dic];
        }
        
        
    }
    return _meItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
    self.tableView.tableHeaderView=self.tableHeader;
    self.tableView.contentInset=UIEdgeInsetsMake(0, 0, 49, 0);
    self.tableView.scrollIndicatorInsets=self.tableView.contentInset;
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=NO;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.meItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.meItems[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSDictionary *dic=  [self.meItems[indexPath.section] objectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:dic[@"icon"]];
    cell.textLabel.text=dic[@"title"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (kScreenHeight>=667) {
        return 10;
    }
    return 2.5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (kScreenHeight>=667) {
        return 10;
    }
    return 2.5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (kScreenHeight>=667) {
        return 60;
    }
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic=  [self.meItems[indexPath.section] objectAtIndex:indexPath.row];
    NSString *title=   dic[@"title"] ;
    if ([title containsString:@"会员升级"])
    {
        
    }
    if ([title containsString:@"现金流水"])
    {
        
    }
    if ([title containsString:@"下载管理"])
    {
        
    }
    if ([title containsString:@"最近播放"])
    {
        
    }
    if ([title containsString:@"我的收藏"])
    {
        
    }
    if ([title containsString:@"我的分享"])
    {
        
    }
    if ([title containsString:@"设置"])
    {
        
    }
    if ([title containsString:@"帮助"])
    {
        
    }
}
@end
