//
//  CommRootModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CommRootModel : NSObject
@property(nonatomic,strong)NSNumber *returnCode; //状态码
@property(nonatomic,copy)NSString *message;//返回信息
@property(nonatomic,strong)NSArray<CommDataModel *> *data;

@end

NS_ASSUME_NONNULL_END
