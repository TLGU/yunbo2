//
//  SearchViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/10/18.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchVCCell.h"
#import "SearchView.h"
@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)UISearchBar *searchBar;

@property(nonatomic,strong)SearchView *searchView;

@property(strong,nonatomic)UIButton *dowmButton;


@end

@implementation SearchViewController

static NSString *SearchViewControllerCellID =@"SearchViewControllerCellID";

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupTableView];
    [self setupNav];

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBar.hidden=NO;
    
}
#pragma mark--下载管理
-(void)downLoadCenter:(id)sender{
    
}
#pragma mark--
#pragma mark--private method
-(void)setupNav
{
    UIView  *nav=[[UIView alloc ] initWithFrame:CGRectMake(0, 20, kScreenWidth, 50)];
    
    [self.view addSubview:nav];
    
    [nav addSubview:self.searchView];
    
    nav .backgroundColor=kRGB(101, 169, 252);
    
    [nav addSubview:self.dowmButton];
    
}


-(void)setupTableView
{
    [self.tableView registerNib:[UINib nibWithNibName:@"SearchVCCell" bundle:nil]forCellReuseIdentifier:SearchViewControllerCellID];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    

}
#pragma mark--
#pragma mark--清空历史搜索记录
-(void)clearMemoryAction:(id)sender{
    
}
#pragma mark--
#pragma mark--换一拨搜索
-(void)reChangeAction:(id)sender{
    
}
#pragma mark--
#pragma mark--UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  SearchVCCell *cell=  [tableView dequeueReusableCellWithIdentifier:SearchViewControllerCellID forIndexPath:indexPath];
    
    return cell;
}
#pragma mark--
#pragma mark--UITableViewDelegate
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    switch (section)
    {
        case 0:
        {
            return [self getSectionWithTitle:@"搜索记录" rightTitle:@"清空记录"];
        }
        break;
        case 1:
        {
            return [self getSectionWithTitle:@"今日热搜" rightTitle:@""];
        }
            break;
        case 2:
        {
            return [self getSectionWithTitle:@"电影风云榜" rightTitle:@""];
        }
        break;
            
        default:break;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section!=0) {
        return 40;
    }
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section!=0) {
      return   [self getSectionFooter];
    }
    return nil;
}
#pragma mark--
#pragma mark--getter and setter
-(SearchView *)searchView
{
    if (!_searchView)
    {
        _searchView=[SearchView searhView];
        
        [_searchView setFrame:CGRectMake(15, 5, kScreenWidth-70, 40)];
        
        _searchView.backgroundColor=[UIColor whiteColor];
        
        [_searchView setCornerRad:20];
        
    }
    return _searchView;
}


-(UIButton *)dowmButton{
    if (!_dowmButton) {
        _dowmButton=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-65, 5, 60, 40)];
        [_dowmButton setImage:[UIImage imageNamed:@"xiazai_03"] forState:UIControlStateNormal];
        
        [_dowmButton addTarget:self action:@selector(downLoadCenter:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dowmButton;
}



-(UIView*)getSectionWithTitle:(NSString *)title rightTitle:(NSString *)rightTitle
{
    UIView  *view=    [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    view.backgroundColor=[UIColor whiteColor];
    UILabel *label=[[UILabel alloc ] initWithFrame:CGRectMake(10, 0, 100, 30)];
    label.textColor=[UIColor grayColor];
    label.text=title;
    UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(0, 29, kScreenWidth, 1)];
    lineView.backgroundColor=[UIColor grayColor];
    label.font=[UIFont systemFontOfSize:14];
    UIButton  *rightLabel=[[UIButton alloc] initWithFrame:CGRectMake( kScreenWidth-120,0, 120, 30)];
    [rightLabel setTitleColor:kRGB(83, 147, 247) forState:UIControlStateNormal];
    [rightLabel addTarget:self action:@selector(clearMemoryAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightLabel  setTitle:rightTitle forState:UIControlStateNormal];
    rightLabel.titleLabel.font=label.font;
    [view addSubview:label];
    [view addSubview:rightLabel];
    [view addSubview:lineView];
    return view;
}

-(UIView *)getSectionFooter
{
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    view.backgroundColor=[UIColor whiteColor];
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-80, 0, 60, 40)];
    [button setTitleColor:kRGB(83, 147, 247) forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:14];
    [button setTitle:@"换一波" forState:UIControlStateNormal];
    UIButton *button1=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-30, 0, 20, 40  )];
    [button1 setImage:[UIImage imageNamed:@"new_03"] forState:UIControlStateNormal];
    [view addSubview:button];
    [view addSubview:button1];
    [button addTarget:self action:@selector(reChangeAction:) forControlEvents:UIControlEventTouchUpInside];
    [button1 addTarget:self action:@selector(reChangeAction:) forControlEvents:UIControlEventTouchUpInside];
    return view;
}
@end
