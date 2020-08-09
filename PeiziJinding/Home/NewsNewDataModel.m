//
//  NewsNewDataModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "NewsNewDataModel.h"

@implementation NewsNewDataModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [NewsNewDataModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"news":@"NewsDetaiItemModel"};
        }];
    }
    return self;
}
@end
