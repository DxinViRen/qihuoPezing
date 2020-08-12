//
//  MarketDetailModel.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 @property(nonatomic,strong)UILabel *mTitleLabel;    //名称
 @property(nonatomic,strong)UILabel *neTitleLanbel;  //年份
 @property(nonatomic,strong)UILabel *lastPrice;      //最新价格
 @property(nonatomic,strong)UILabel *turnoverLabel;  //成交量
 @property(nonatomic,strong)UILabel *rangeLabel;     //幅度
 */
@interface MarketDetailModel : NSObject
@property (nonatomic,copy)NSString *product_code;  //NECLK0
@property (nonatomic,copy)NSString *product_desc;  //手续费158元／手
@property (nonatomic,strong)NSNumber *is_open;   //是否开市
@property (nonatomic,copy)NSString *next_open; //下次开市时间
@property (nonatomic,copy)NSString *product_name;//nLabelText
@property (nonatomic,copy)NSString *cat_name;  //title;
@property (nonatomic,copy)NSString *cat_code;  //CL
@property (nonatomic,copy)NSString *cat_color;//
@property (nonatomic,strong)NSNumber *order_num;
@property (nonatomic,strong)NSNumber *order_gift_num;
@property (nonatomic,strong)NSNumber *total_trading;
@property (nonatomic,strong)NSNumber *pid;

@property (nonatomic,strong)NSArray *pre_numArr;

@end

NS_ASSUME_NONNULL_END
