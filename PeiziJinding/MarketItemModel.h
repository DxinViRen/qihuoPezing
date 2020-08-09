//
//  MarketItemModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarketDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MarketItemModel : NSObject
@property (nonatomic,strong)NSArray <MarketDetailModel *>*products_list;
@property (nonatomic,strong)NSArray *list;
@end

NS_ASSUME_NONNULL_END
