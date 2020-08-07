//
//  HomeHeaderModel.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainCellModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@interface HomeHeaderModel : NSObject<MainCellModelProtocol>
@property(nonatomic,strong)NSArray *imgUrlArr;
@end

NS_ASSUME_NONNULL_END
