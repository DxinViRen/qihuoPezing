//
//  NewsNewModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/6.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "NewsNewModel.h"

@implementation NewsNewModel
@synthesize cellName;
@synthesize cellWight;
@synthesize cellHeight;
@synthesize cellInderfier;
@synthesize extra;
- (instancetype)init
{
    self = [super init];
    if (self) {
        /**
         
        
         */
        [NewsNewModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID":@"id"};
        }];
    }
    return self;
}
@end
