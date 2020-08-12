//
//  CommCommentJsonModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommCommentJsonModel.h"

@implementation CommCommentJsonModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [CommCommentJsonModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"parentList":@"CommDetailItemModel"};
        }];
    }
    return self;
}
@end
