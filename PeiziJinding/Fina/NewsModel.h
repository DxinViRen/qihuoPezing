//
//  NewsModel.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsModel : NSObject<MainCellModelProtocol>
@property (nonatomic,copy)NSString *haveSaw;
@property (nonatomic,copy)NSString *source;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *title;
@end

NS_ASSUME_NONNULL_END
