//
//  CalNews.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CalNews.h"

@implementation CalNews
- (instancetype)init
{
    self = [super init];
    if (self) {
        [CalNews mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                @"newsData":@"CalNewsModel"
            };
        }];
    }
    return self;
}
@end
