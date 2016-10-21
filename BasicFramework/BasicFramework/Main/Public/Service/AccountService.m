//
//  AccountService.m
//  BasicFramework
//
//  Created by mr_right on 16/10/20.
//  Copyright © 2016年 Rainy. All rights reserved.
//

#import "AccountService.h"

@implementation AccountService
//获取手机验证码
+(void)getPhoneRanCodeWithPhone:(NSString *)phone
                         target:(UIViewController *)targetVC
                         sucess:(void (^)(id value))sucessBlock
                        failure:(void (^)(id value))failureBlock
{
    if (!phone)
    {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号码"];
        return;
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    dic[@"phone"]=phone;
    [SVProgressHUD show];
    [[NetWorkManager sharedInstance] requestDataForGETWithURL:@"rand/getPhoneRand.do"
                                                   parameters:dic
                                                   Controller:targetVC
                                                      success:^(id responseObject)
     {
         
         [SVProgressHUD dismiss];
         if (sucessBlock)
         {
             NSString *rand=   [responseObject objectForKey:@"rand"];
             NSString *message=  [responseObject objectForKey:@"message"];
             NSLog(@"验证码是:%@",rand);
             sucessBlock(message);
             
         }
     } failure:^(NSError *error)
     {
         [SVProgressHUD dismiss];
         if (failureBlock)
         {
             failureBlock(error);
         }
     }];
    
    
    
}

//手机注册

+(void)registerWithPhone:(NSString *)phone
                randCode:(NSString *)randCode
                 userPwd:(NSString *)userPwd
              userPwd_ok:(NSString *)userPwd_ok
                  target:(UIViewController *)targetVC
                  sucess:(void (^)(id value))sucessBlock
                 failure:(void (^)(id value))failureBlock
{
    
    if (!phone.length||!randCode.length||!userPwd.length||!userPwd_ok.length)
    {
        [SVProgressHUD showErrorWithStatus:@"参数不完整"];
        return;
    }
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"username"]=phone;
    params[@"randCode"]=randCode;
    params[@"userpwd"]=userPwd;
    params[@"userpwd_ok"]=userPwd_ok;
    [SVProgressHUD show];
    [[NetWorkManager sharedInstance] requestDataForPOSTWithURL:@"front/register.do"
                                                    parameters:params
                                                    Controller:targetVC
                                                       success:^(id responseObject)
     {
         
         [SVProgressHUD showSuccessWithStatus:@"注册成功."];
         
         NSString *key= [responseObject objectForKey:@"key"];
         
         
         [[NSUserDefaults standardUserDefaults] setObject:key forKey:user_name_key];
         
         [[NSUserDefaults standardUserDefaults] synchronize];
         
         if (sucessBlock)
         {
             sucessBlock(responseObject);
             
         }
         
     } failure:^(NSError *error)
     {
         
         if (failureBlock)
         {
             failureBlock(error);
         }
     }];
    
    
    
    
}
//第三方平台登录

+(void)thirdLoginWithNickname:(NSString *)nickname
                   headimgurl:(NSString *)headimgurl
                          sex:(NSString *)sex
                third_user_id:(NSString *)third_user_id
              third_user_type:(NSString *)third_user_type
                       target:(UIViewController *)targetVC
                       sucess:(void (^)(id value))sucessBlock
                      failure:(void (^)(id value))failureBlock
{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"nickname"]=nickname;
    params[@"headimgurl"]=headimgurl;
    params[@"sex"]=sex;
    params[@"third_user_id"]=third_user_id;
    params[@"third_user_type"]=third_user_type;
    [SVProgressHUD show];
    [[NetWorkManager sharedInstance] requestDataForPOSTWithURL:@"front/register_third_user.do"
                                                    parameters:params
                                                    Controller:targetVC
                                                       success:^(id responseObject)
     {
         
         NSString * message=  [responseObject objectForKey:@"message"];
         
         [SVProgressHUD showSuccessWithStatus:message];
         
         NSString *key= [responseObject objectForKey:@"key"];
         
         
         [[NSUserDefaults standardUserDefaults] setObject:key forKey:user_name_key];
         
         [[NSUserDefaults standardUserDefaults] synchronize];
         
         if (sucessBlock)
         {
             sucessBlock(responseObject);
             
         }
         
     } failure:^(NSError *error)
     {
         
         if (failureBlock)
         {
             failureBlock(error);
         }
     }];
    
}



@end
