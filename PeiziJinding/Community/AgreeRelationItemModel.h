//
//  AgreeRelationItemModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AgreeRelationItemModel : NSObject
@property(nonatomic,strong)NSNumber *ID;
@property(nonatomic,strong)NSNumber *userId;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *userHeadPhoto;
@property(nonatomic,copy)NSNumber *sayId;
@property(nonatomic,copy)NSNumber *agreeTime;

@end

NS_ASSUME_NONNULL_END
