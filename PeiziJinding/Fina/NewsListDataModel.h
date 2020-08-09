//
//  NewsListDataModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/6.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModel.h"
#import "NewsNewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsListDataModel : NSObject<MainCellModelProtocol>
@property(nonatomic,strong)NSArray<NewsNewModel*>*newsList;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,copy)NSString *code;
@end

NS_ASSUME_NONNULL_END
