//
//  CalNews.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalNewsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CalNews : NSObject
@property(nonatomic,strong)NSArray <CalNewsModel *>*newsData;


@end

NS_ASSUME_NONNULL_END
