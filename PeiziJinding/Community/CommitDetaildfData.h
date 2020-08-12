//
//  CommitDetaildfData.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommSayModel.h"
#import "CommCommentJsonModel.h"
#import "AgreeRelationItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommitDetaildfData : NSObject
@property(nonatomic,strong)CommSayModel *say;
@property(nonatomic,strong)NSArray *comments;
@property(nonatomic,strong)NSArray *topics;
@property(nonatomic,copy)NSString *disclaimer;
@property(nonatomic,strong)NSArray<AgreeRelationItemModel *> *agreeRelations;
@property(nonatomic,strong)CommCommentJsonModel *commentJson;
@end

NS_ASSUME_NONNULL_END
