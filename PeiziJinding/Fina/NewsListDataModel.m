//
//  NewsListDataModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/6.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "NewsListDataModel.h"

@implementation NewsListDataModel
@synthesize cellName;
@synthesize cellWight;
@synthesize cellHeight;
@synthesize cellInderfier;
@synthesize extra;
- (instancetype)init
{
    self = [super init];
    if (self) {
        [NewsListDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{ @"newsList":@"NewsNewModel"};
        }];
    }
    return self;
}
@end
