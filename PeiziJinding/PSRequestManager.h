//
//  PSRequestManager.h
//  PriorSelect
//  网络请求
//  Created by wisekory on 2018/7/9.
//  Copyright © 2018年 QiYang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HttpRequestMethod){
    HttpRequestMethodPOST,
    HttpRequestMethodGET
    
};

typedef void (^netBlock)(id __nullable responseObject,NSError * _Nullable error);
@interface PSRequestManager : NSObject
+(instancetype _Nullable )shareInstance;

-(NSURLSessionDataTask *)netRequestWithUrl:(NSString *_Nonnull)url method:(HttpRequestMethod )method param:(id _Nullable )param successBlock:(netBlock _Nullable )success failure:(netBlock _Nullable )failure;

- (NSURLSessionDataTask *)netReuqestWithUrl:(NSString *)url method:(HttpRequestMethod)method param:(id)param successBlock:(netBlock _Nullable )success failure:(netBlock _Nullable )failure extral:(NSDictionary *)dic;
@end
