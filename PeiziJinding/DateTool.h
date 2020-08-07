//
//  DateTool.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateTool : NSObject
+ (NSString *)getDateStr;
+ (NSString *)getweekStr;
+ (NSArray  *)getDateArr;
+ (NSArray  *)getWeekArr;
+ (NSArray *)getCuWekArr;
+ (NSString *)getMounthStr;
+ (NSString *)getCurrentDateStr;
@end

NS_ASSUME_NONNULL_END
