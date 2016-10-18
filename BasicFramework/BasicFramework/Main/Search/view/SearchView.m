//
//  SearchView.m
//  BasicFramework
//
//  Created by mr_right on 16/10/18.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView
+(instancetype)searhView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

@end
