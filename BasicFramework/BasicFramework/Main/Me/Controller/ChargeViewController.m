//
//  ChargeViewController.m
//  BasicFramework
//
//  Created by mr_right on 16/9/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ChargeViewController.h"

#import "ChargeTypeCell.h"
#import "ChargeHeader.h"

@interface ChargeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic) ChargeHeader *tableHeader;

@property(strong,nonatomic)UIView * footerView;

@end
static NSString *reuseIdentifierChargeViewController=@"reuseIdentifierChargeViewController";
@implementation ChargeViewController
-(UIView *)footerView{
    if (!_footerView) {
        _footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        UIButton *chargeButton=[[UIButton alloc] initWithFrame:CGRectMake(20, 5, kScreenWidth-40, 40)];
        [chargeButton setTitle:@"充值" forState:UIControlStateNormal];
        [chargeButton setBackgroundColor:kRGB(84, 149, 250)];
        [chargeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [chargeButton addTarget:self action:@selector(chargeAction:) forControlEvents:UIControlEventTouchUpInside];
        [chargeButton setCornerRad:5];
        [_footerView addSubview:chargeButton];
    }
    return _footerView;
}

-(ChargeHeader *)tableHeader{
    if (!_tableHeader) {
        _tableHeader=[ChargeHeader header];
        [_tableHeader setFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    }
    return _tableHeader;
}

-(void)chargeAction:(UIButton *)sender{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"充值";
    [self.tableView registerNib:[UINib nibWithNibName:@"ChargeTypeCell" bundle:nil] forCellReuseIdentifier:reuseIdentifierChargeViewController];
    self.tableView.tableHeaderView=self.tableHeader;
    self.tableView.tableFooterView=self.footerView;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  ChargeTypeCell *cell=  [tableView dequeueReusableCellWithIdentifier:reuseIdentifierChargeViewController forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}




@end
