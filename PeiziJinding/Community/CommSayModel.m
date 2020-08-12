//
//  CommSayModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommSayModel.h"

@implementation CommSayModel
@synthesize cellName;
@synthesize cellWight;
@synthesize cellHeight;
@synthesize cellInderfier;
@synthesize extra;
- (instancetype)init
{
    self = [super init];
    if (self) {
        [CommSayModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID":@"id"};
        }];
        self.pre_textH = 100;
        self.pre_imgsize = CGSizeMake(0.1, 0.1);
    }
    return self;
}
@end
