//
//  CommDetailItemModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommDetailItemModel.h"

@implementation CommDetailItemModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [CommDetailItemModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                @"ID":@"id"
            };
        }];
        
        [CommDetailItemModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"sonList":@"CommDetailItemModel"};
        }];
    }
    return self;
}
@end
