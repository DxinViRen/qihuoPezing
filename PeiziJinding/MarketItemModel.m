//
//  MarketItemModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketItemModel.h"

@implementation MarketItemModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [MarketItemModel mj_setupObjectClassInArray:^NSDictionary *{
           return @{
               @"products_list":@"MarketDetailModel"
           };
        }];
    }
    return self;
}
@end
