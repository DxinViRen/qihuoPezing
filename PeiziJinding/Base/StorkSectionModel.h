//
//  StorkSectionModel.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>
NS_ASSUME_NONNULL_BEGIN

@interface StorkSectionModel : NSObject<IGListDiffable>
@property (nonatomic,strong)NSMutableArray *dataArray;
- (instancetype)initWithArray:(NSMutableArray *)array;
@end

NS_ASSUME_NONNULL_END
