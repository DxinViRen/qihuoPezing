//
//  AgreeRelationItemModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "AgreeRelationItemModel.h"

@implementation AgreeRelationItemModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [AgreeRelationItemModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID":@"id"};
        }];
    }
    return self;
}
@end
