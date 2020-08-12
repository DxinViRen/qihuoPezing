//
//  CommCommentJsonModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommDetailItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommCommentJsonModel : NSObject
@property(nonatomic,strong)NSArray<CommDetailItemModel *>*parentList;
@end

NS_ASSUME_NONNULL_END
