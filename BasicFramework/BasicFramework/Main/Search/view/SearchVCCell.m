//
//  SearchVCCell.m
//  BasicFramework
//
//  Created by mr_right on 16/10/18.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "SearchVCCell.h"

@implementation SearchVCCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
