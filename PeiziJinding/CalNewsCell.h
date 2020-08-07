//
//  CalNewsCell.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MainCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CalNewsCell : MainCollectionViewCell
@property (nonatomic,strong)UILabel * timeLabel;       //时间
@property (nonatomic,strong)UILabel * statusLAbel;     // 状态
@property (nonatomic,strong)UILabel * maintitleLabel;  //标题
@property (nonatomic,strong)UILabel * consensusLabel;  //预期
@property (nonatomic,strong)UILabel * previousLabel;  //前值
@property (nonatomic,strong)UILabel * actualLabel;    //前值
@end

NS_ASSUME_NONNULL_END
