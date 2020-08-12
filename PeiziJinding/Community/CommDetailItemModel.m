//
//  CommDetailItemModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommDetailItemModel.h"

@implementation CommDetailItemModel
@synthesize cellName;
@synthesize cellWight;
@synthesize cellHeight;
@synthesize cellInderfier;
@synthesize extra;
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.pre_SonH = [@[] mutableCopy];
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
