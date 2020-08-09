//
//  NewsDetaiItemModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetaiItemModel : NSObject<MainCellModelProtocol>
@property(nonatomic,copy)NSString *url_w;//  详情页面
@property(nonatomic,copy)NSString *title;//title
@property(nonatomic,copy)NSString *Art_Media_Name;//来源
@property(nonatomic,copy)NSString *image;//图片
@property(nonatomic,copy)NSString *showtime;//时间

@end

NS_ASSUME_NONNULL_END
