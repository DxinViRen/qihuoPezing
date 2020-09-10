//
//  NewsRotModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/9/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "NewsRotModel.h"
#import "NewsRItemModel.h"
@implementation NewsRotModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [NewsRotModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                @"data":@"NewsRItemModel"
            };
        }];
    }
    return self;
}
@end
