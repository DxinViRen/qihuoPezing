//
//  CommSayModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommSayModel : NSObject<MainCellModelProtocol>
@property(nonatomic,copy)NSString *senderPhoto; //头像
@property(nonatomic,copy)NSString *senderNickName;//发帖人
@property(nonatomic,strong)NSArray *pics; //发表的图片
@property(nonatomic,copy)NSString *content; //内容
@property(nonatomic,copy)NSString *tags; //标签
@property(nonatomic,copy)NSString *countOfComment;//评论数量
@property(nonatomic,copy)NSString *countOfAgree;//点赞数量
@property(nonatomic,copy)NSString *senderMedalImage;//会员等级可能为nil
@property(nonatomic,copy)NSString *timeForShow;//发帖时间
@end

NS_ASSUME_NONNULL_END
