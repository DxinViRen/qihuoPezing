//
//  NewsNewModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/6.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsNewModel : NSObject<MainCellModelProtocol>
@property(nonatomic,copy)NSString *date; //日期
@property(nonatomic,strong)NSNumber *ID;
@property(nonatomic,copy)NSString *thumb;
@property(nonatomic,copy)NSString *title;
@end

NS_ASSUME_NONNULL_END
