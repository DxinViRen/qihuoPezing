//
//  MarketModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarketItemModel.h"
#import "MarketTypeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarketModel : NSObject
@property(nonatomic,strong)MarketTypeModel *parent_classify_type;
@property(nonatomic,strong)MarketItemModel *GJQH;
@property(nonatomic,strong)MarketItemModel *GZQH;
@property(nonatomic,strong)MarketItemModel *WHQH;
@property(nonatomic,strong)MarketItemModel *GNQH;
@end

NS_ASSUME_NONNULL_END
