//
//  ChargeHeader.m
//  BasicFramework
//
//  Created by mr_right on 16/9/27.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "ChargeHeader.h"

@interface ChargeHeader ()

@end

@implementation ChargeHeader

+(instancetype)header{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


-(void)awakeFromNib{
    [super awakeFromNib];
    
//    self.layer.cornerRadius = cornerRad;
//    self.layer.masksToBounds = YES;
        

}
- (IBAction)action:(UIButton *)sender {
    
}

@end
