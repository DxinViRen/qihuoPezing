//
//  MarketRootModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarketModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MarketRootModel : NSObject
@property (nonatomic,copy)NSString *code;
@property (nonatomic,strong)MarketModel *data;
@property (nonatomic,copy)NSString *msg;
@end

NS_ASSUME_NONNULL_END
