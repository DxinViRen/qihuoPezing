//
//  CalResponseModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalNewsModel.h"
#import "CalNews.h"
NS_ASSUME_NONNULL_BEGIN

@interface CalResponseModel : NSObject<MainCellModelProtocol>
@property(nonatomic,strong)CalNews *news;
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *message;

@end

NS_ASSUME_NONNULL_END
