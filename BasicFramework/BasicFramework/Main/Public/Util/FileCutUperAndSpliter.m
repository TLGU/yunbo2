//
//  CutUpper.m
//  BasicFramework
//
//  Created by mr_right on 16/10/15.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "FileCutUperAndSpliter.h"

@implementation FileCutUperAndSpliter

//文件分割

-(NSArray *)cutFileAtPath:(NSString *)filePath withIndexs:(NSArray *)indexs
{
    NSMutableArray *subDataArray=[NSMutableArray arrayWithCapacity:indexs.count];
    
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    for (int i=0; i <indexs.count; i++)
    {
       NSDictionary *dic= indexs[i];
        
       int  startIndex= [dic[@"start"] intValue];//开始下标
        
       int  endIndex= [dic[@"end"] intValue];//结束下标
        
       int  length=endIndex-startIndex;
        
       NSData *subData=nil;
        
       if (length>0&&data.length>startIndex)
       {
           subData= [data subdataWithRange:NSMakeRange(startIndex, length)];
       }
       
        if (subData.length) {
            
            NSMutableDictionary *mData=[NSMutableDictionary dictionary];
            
            mData[@"data"]=subData;
            
            mData[@"start"]=@(startIndex);
            
            mData[@"end"]=@(endIndex);
            
            mData[@"fileName"]=[NSString stringWithFormat:@"filename_start_index_%d",startIndex];
            
            [subDataArray addObject:mData];
        }
       
    }
    
    return subDataArray;
}


//文件拼接

+(NSURL*)splitWithFiles:(NSArray *)files fileName:(NSString *)name
{
//    NSMutableData *vedioData=[NSMutableData data];
//    //文件拼接
//    for (int i=0; i<files.count; i++) {
//       
//        NSDictionary *fileDic=   files[i];
//        
//        NSString *fileUrlStr=   fileDic[@"url"];
//        
//        int start = fileDic[@"start"];
//        
//       NSData *data= [NSData dataWithContentsOfFile:fileUrlStr];
//        
//        
//        
//    }
//    //创建目标文件
    
//    NSFileManager *fileManager = [[NSFileManager alloc] init];
//    
//    NSString *pathDocuments = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    
//    NSString *createPath = [[NSString stringWithFormat:@"%@/SplitVedio", pathDocuments] stringByAppendingPathComponent:name];
//    
//    
//    BOOL fileExists=  [fileManager fileExistsAtPath:createPath];
//    
//    if (!fileExists&&vedioData.length) {
//        
//        [fileManager createFileAtPath:createPath contents:vedioData attributes:nil];
//    }
    
    return nil;
}



@end



