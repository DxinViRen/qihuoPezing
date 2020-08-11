//
//  CommDataModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommSayModel.h"
#import "CommitReCommetModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommDataModel : NSObject<MainCellModelProtocol>
@property(nonatomic,strong)CommSayModel *say;
@property(nonatomic,strong)CommitReCommetModel *recommendComment;
@property(nonatomic,strong)NSArray *tagList;

@property(nonatomic,assign)BOOL  pre_isSopt;
@property(nonatomic,assign)BOOL  pre_isAtten;
@end

NS_ASSUME_NONNULL_END
