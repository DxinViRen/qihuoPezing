//
//  UserItemCell.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MainCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserItemCell : MainCollectionViewCell
@property(nonatomic,strong)UIImageView *iconImageView;
@property(nonatomic,strong)UILabel *titLabel;
@property(nonatomic,strong)UIView *toplineView;
@property(nonatomic,strong)UIView *botLineView;
@end

NS_ASSUME_NONNULL_END
