//
//  StorkSectionController.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "IGListSectionController.h"
#import "MainCellModelProtocol.h"
#import "StorkSectionModel.h"
#import "MainCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface StorkSectionController : IGListSectionController
@property(nonatomic,copy)void(^cellDidClickBlock)(id<MainCellModelProtocol>model,NSInteger index);//cell点击
@property(nonatomic,copy)void(^configCellBlock)(id<MainCellModelProtocol>mode,MainCollectionViewCell*cell,NSInteger index);
@property(nonatomic,strong)StorkSectionModel *object;
- (void)configCell:(MainCollectionViewCell *)cell  withModel:(id<MainCellModelProtocol>)model index:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
