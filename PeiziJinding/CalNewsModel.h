//
//  CalNewsModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
                @property (nonatomic,strong)UILabel * timeLabel;       //时间
                @property (nonatomic,strong)UILabel * statusLAbel;     // 状态
                @property (nonatomic,strong)UILabel * maintitleLabel;  //标题
                @property (nonatomic,strong)UILabel * consensusLabel;  //预期
                @property (nonatomic,strong)UILabel * previousLabel;  //前值
                @property (nonatomic,strong)UILabel * actualLabel;    //前值
 */
@interface CalNewsModel : NSObject<MainCellModelProtocol>
@property(nonatomic,copy)NSString *actual;    //今值
@property(nonatomic,copy)NSString *consensus; //预期
@property(nonatomic,copy)NSString *previous;  //前值
@property(nonatomic,copy)NSString *star;      //星数
@property(nonatomic,copy)NSString *status_name;//状态
@property(nonatomic,copy)NSString *time_show; //时间
@property(nonatomic,copy)NSString *title;     //标题
@property(nonatomic,copy)NSString *unit;     //单位
@property(nonatomic,copy)NSString *country;  //国家
@end

NS_ASSUME_NONNULL_END
