//
//  CommitReCommetModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommitReCommetModel : NSObject
@property(nonatomic,copy)NSString *nickName;//昵称
@property(nonatomic,copy)NSString *content; //评论内容
@property(nonatomic,copy)NSString *photo; //头像
@end

NS_ASSUME_NONNULL_END
