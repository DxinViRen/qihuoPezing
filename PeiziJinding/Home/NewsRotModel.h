//
//  NewsRotModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/9/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsNewModel.h"
#import "NewsRItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsRotModel : NSObject
@property(nonatomic,strong)NSNumber *code;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSArray <NewsRItemModel *>*data;
@end

NS_ASSUME_NONNULL_END
