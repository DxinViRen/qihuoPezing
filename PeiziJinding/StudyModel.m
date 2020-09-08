//
//  StudyModel.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/18.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "StudyModel.h"

@implementation StudyModel
@synthesize cellName;
@synthesize cellWight;
@synthesize cellHeight;
@synthesize cellInderfier;
@synthesize extra;
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isSetdata =  NO;
        
    }
    return self;
}
@end
