//
//  MakeMoneyViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/9/29.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "MakeMoneyViewController.h"
#import "MakeMoneyCell.h"
#import "MakeMoneyHeader.h"
@interface MakeMoneyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) MakeMoneyHeader *header;
@property(strong,nonatomic) NSMutableArray *dataArray;


@end
static NSString * reusableCellIdForMakeMoney=@"reusableCellIdForMakeMoney";
@implementation MakeMoneyViewController
-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray=[NSMutableArray array];
        NSMutableDictionary  *mdic0=[NSMutableDictionary dictionary];
        mdic0[@"title"]=@"我的视频资源";
        mdic0[@"icon"]=@"me_icon_4";
        NSMutableDictionary  *mdic1=[NSMutableDictionary dictionary];
        mdic1[@"title"]=@"帮助";
        mdic1[@"icon"]=@"me_icon2_1";
        [_dataArray addObject:@[mdic0]];
        [_dataArray addObject:@[mdic1]];
    }
    return _dataArray;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden=NO;
}

-(MakeMoneyHeader *)header
{
    if (!_header) {
        _header=[MakeMoneyHeader header];
        [_header setFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    }
    return _header;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"MakeMoneyCell" bundle:nil] forCellReuseIdentifier:reusableCellIdForMakeMoney];
    self.tableView.tableHeaderView=self.header;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
      return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  NSDictionary *dic=  [self.dataArray[indexPath.section] objectAtIndex:indexPath.row];
   MakeMoneyCell *cell= [tableView dequeueReusableCellWithIdentifier:reusableCellIdForMakeMoney forIndexPath:indexPath];
    cell.textLabel.text=dic[@"title"];
    cell.imageView.image=[UIImage imageNamed:dic[@"icon"]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

@end
