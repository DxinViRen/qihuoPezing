//
//  NewsNewDataModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetaiItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsNewDataModel : NSObject
@property(nonatomic,strong)NSArray<NewsDetaiItemModel *>*news;
@property(nonatomic,strong)NSNumber *rc;

@end

NS_ASSUME_NONNULL_END
