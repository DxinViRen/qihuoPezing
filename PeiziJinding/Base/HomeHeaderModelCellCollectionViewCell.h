//
//  HomeHeaderModelCellCollectionViewCell.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
NS_ASSUME_NONNULL_BEGIN

@interface HomeHeaderModelCellCollectionViewCell : MainCollectionViewCell
@property(nonatomic,strong)SDCycleScrollView *sdcycleScView;
@end

NS_ASSUME_NONNULL_END
