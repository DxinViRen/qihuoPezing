//
//  MarketTypeModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MarketTypeModel : NSObject
@property (nonatomic,copy)NSString *GJQH;  //能源期货
@property (nonatomic,copy)NSString *GZQH;  //股指期货
@property (nonatomic,copy)NSString *WHQH;  //金属期货
@property (nonatomic,copy)NSString *GNQH;  //农产品期货
@end

NS_ASSUME_NONNULL_END
