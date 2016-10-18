//
//  SearchListViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/10/18.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "SearchListViewController.h"
#import "SearchListCell.h"
@interface SearchListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *tableView;
@end

@implementation SearchListViewController
static NSString * SearchListViewControllerCellID=@"SearchListViewControllerCellID";
#pragma mark--
#pragma mark--getter and setter
-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
        [_tableView registerNib:[UINib nibWithNibName:@"SearchListCell" bundle:nil] forCellReuseIdentifier:SearchListViewControllerCellID];
        [self.view addSubview:_tableView];
        _tableView.tableHeaderView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        
    }
    return _tableView;
}
#pragma mark--
#pragma mark--life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"搜索列表";
    __weak AppSingle *single= [AppSingle Shared];
    WS(weakSelf)
    [single addHeaderPullOnView:self.tableView waitTime:0 action:^{
        [single headerEndRefreshing:weakSelf.tableView];
    }];
   
}



#pragma mark--
#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchListCell *cell=[tableView dequeueReusableCellWithIdentifier:SearchListViewControllerCellID forIndexPath:indexPath];
    
    return cell;
}
#pragma mark--
#pragma mark--UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (kScreenHeight-64)/6.0f;
}
@end
