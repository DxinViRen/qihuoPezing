//
//  CommDetailRoot.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommDetailRoot.h"

@implementation CommDetailRoot
- (instancetype)init
{
    self = [super init];
    if (self) {
        [CommDetailRoot mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"data":@"CommitDetaildfData"};
        }];
    }
    return self;
}
@end
