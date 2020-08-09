//
//  HomegyNotiCell.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "GYNoticeViewCell.h"
#import "HomeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomegyNotiCell : GYNoticeViewCell
@property(nonatomic,strong)HomeModel *model;
@property(nonatomic,strong)UILabel  *dxTitleLabel;
@property(nonatomic,strong)UIImageView  *dxImageView;

@end

NS_ASSUME_NONNULL_END
