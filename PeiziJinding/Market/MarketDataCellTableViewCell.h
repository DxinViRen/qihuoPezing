//
//  MarketDataCellTableViewCell.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MarketDataCellTableViewCell : UITableViewCell
@property(nonatomic,strong)MarketDetailModel *model;
@property(nonatomic,strong)NSArray *numDaraArr;
@property(nonatomic,strong)UILabel *mTitleLabel;    //名称
@property(nonatomic,strong)UILabel *neTitleLanbel;  //年份
@property(nonatomic,strong)UILabel *lastPrice;      //最新价格
@property(nonatomic,strong)UILabel *turnoverLabel;  //成交量
@property(nonatomic,strong)UILabel *rangeLabel;     //幅度

@end

NS_ASSUME_NONNULL_END
