//
//  CutUpper.h
//  BasicFramework
//
//  Created by mr_right on 16/10/15.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import <Foundation/Foundation.h>
//文件分割器
@interface FileCutUperAndSpliter : NSObject

//文件分割方法
+(NSArray *)cutFileAtPath:(NSString *)filePath withIndexs:(NSArray *)indexs;

//文件拼接

+(NSURL*)splitWithFiles:(NSArray *)files;

@end
