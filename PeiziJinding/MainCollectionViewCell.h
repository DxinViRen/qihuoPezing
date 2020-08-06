//
//  MainCollectionViewCell.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainCellModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)id<MainCellModelProtocol>model;
@end

NS_ASSUME_NONNULL_END
