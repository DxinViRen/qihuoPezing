//
//  NewsRItemModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/9/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsRItemModel : NSObject<MainCellModelProtocol>
@property (nonatomic,strong)NSNumber *tid;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *desc;
@property (nonatomic,copy)NSString *post_date;
@property (nonatomic,copy)NSString *thumb;

@end

NS_ASSUME_NONNULL_END
