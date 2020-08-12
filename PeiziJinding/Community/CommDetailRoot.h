//
//  CommDetailRoot.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommSayModel.h"
#import "CommCommentJsonModel.h"
#import "CommitDetaildfData.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommDetailRoot : NSObject
@property(nonatomic,strong)NSNumber *returnCode; //状态码
@property(nonatomic,copy)NSString *message;//返回信息
@property(nonatomic,strong)CommitDetaildfData *data;


@end

NS_ASSUME_NONNULL_END
