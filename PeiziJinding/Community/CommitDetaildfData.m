//
//  CommitDetaildfData.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommitDetaildfData.h"

@implementation CommitDetaildfData
- (instancetype)init
{
    self = [super init];
    if (self) {
        [CommitDetaildfData mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"agreeRelations":@"AgreeRelationItemModel"};
        }];
    }
    return self;
}
@end
