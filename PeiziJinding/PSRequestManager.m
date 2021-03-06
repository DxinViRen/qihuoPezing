//
//  PSRequestManager.m
//  PriorSelect
//
//  Created by wisekory on 2018/7/9.
//  Copyright © 2018年 QiYang. All rights reserved.
//

#import "PSRequestManager.h"

@implementation PSRequestManager
static   PSRequestManager * psMana =nil;
+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        psMana = [[PSRequestManager alloc]init];
    });
    return psMana;
}

-(NSURLSessionDataTask *)netRequestWithUrl:(NSString *)url method:(HttpRequestMethod )method param:(id)param successBlock:(netBlock)success failure:(netBlock)failure{
   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager.requestSerializer setTimeoutInterval:10.f];
   
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.securityPolicy.validatesDomainName = NO;
    
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
     //[manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    if(method == HttpRequestMethodGET)
    {
        //GET
        NSURLSessionDataTask * task = [manager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if(success)
            {
                success(responseObject,nil);
                
            }
           
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if(failure)
            {
                failure(nil,error);
//                HUD.animationType = MBProgressHUDModeText;
//                HUD.label.text=@"请求失败,重新发送请求";
//                [HUD performSelector:@selector(removeFromSuperview)  withObject:nil afterDelay:0.0];
            }
        }];
        return task;
    }
    else
    {
        //POST
       NSURLSessionDataTask * task =  [manager POST :url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           
//                //弹出登录页面
//                [[UserManager shareInstance]deleteUserData];
//                [[LoginController shareInstance]login:^{
                    if(success)
                    {
                        success(responseObject,nil);
                        //                [HUD performSelector:@selector(removeFromSuperview)  withObject:nil afterDelay:0.0];
                    }
                //}];
           
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if(failure)
            {
                failure(nil,error);
                
              
            }
        }];
        
        return task;
    }
}

- (NSURLSessionDataTask *)netReuqestWithUrl:(NSString *)url method:(HttpRequestMethod)method param:(id)param successBlock:(netBlock _Nullable )success failure:(netBlock _Nullable )failure extral:(NSDictionary *)dic{
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//     [manager.requestSerializer setValue:@"com.virenQH.app" forHTTPHeaderField:@"bundleid"];
//     [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"contentType"];
//        [manager.requestSerializer setTimeoutInterval:10.f];
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"com.virenQH.app" forHTTPHeaderField:@"bundleid"];
   

  NSURLSessionDataTask * task =  [manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
                          if(success)
                          {
                              success(responseObject,nil);
                              //                [HUD performSelector:@selector(removeFromSuperview)  withObject:nil afterDelay:0.0];
                          }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         if(failure)
                    {
                        failure(nil,error);
        
        
                    }
    }];
            //POST
//   NSURLSessionDataTask * task =  [manager POST :url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
//
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
////                //弹出登录页面
////                [[UserManager shareInstance]deleteUserData];
////                [[LoginController shareInstance]login:^{
//                    if(success)
//                    {
//                        success(responseObject,nil);
//                        //                [HUD performSelector:@selector(removeFromSuperview)  withObject:nil afterDelay:0.0];
//                    }
//                //}];
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//            if(failure)
//            {
//                failure(nil,error);
//
//
//            }
//        }];
            
        return task;
        
}
@end
