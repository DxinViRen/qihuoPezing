//
//  CommDetailItemModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommDetailItemModel : NSObject<MainCellModelProtocol>

@property(nonatomic,strong)NSNumber *ID;
@property(nonatomic,strong)NSNumber *senderId;
@property(nonatomic,copy)NSString *content;   //内容
@property(nonatomic,strong)NSNumber *commentTime;//时间戳
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *photo;//头像
@property(nonatomic,strong)NSArray<CommDetailItemModel *> *sonList;

@property(nonatomic,assign)NSInteger soncount;
@property(nonatomic,assign)CGFloat pre_preContentH;
@property(nonatomic,strong)NSMutableArray *pre_SonH;



@end

NS_ASSUME_NONNULL_END
