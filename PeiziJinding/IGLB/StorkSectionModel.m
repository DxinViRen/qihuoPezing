//
//  StorkSectionModel.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "StorkSectionModel.h"

@implementation StorkSectionModel
- (instancetype)initWithArray:(NSMutableArray *)array{
    if(self = [super init]){
        self.dataArray = array;
    }
    return self;
}

#pragma mark - IGListDiffable
- (id<NSObject>)diffIdentifier
{
    return self;
}

- (BOOL)isEqualToDiffableObject:(id<IGListDiffable>)object
{
    return [self isEqual:object];
}
@end
