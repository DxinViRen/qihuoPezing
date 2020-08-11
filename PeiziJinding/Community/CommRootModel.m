//
//  CommRootModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommRootModel.h"

@implementation CommRootModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [CommRootModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"data":@"CommDataModel"};
        }];
    }
    return self;
}
@end
