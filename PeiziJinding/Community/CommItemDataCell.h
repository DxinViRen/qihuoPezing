//
//  CommItemDataCell.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MainCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN
@class  CommDataModel;
typedef void(^Shareblock)(CommDataModel *sharemodel);
@interface CommItemDataCell : MainCollectionViewCell

@property(nonatomic,copy)Shareblock shablock;
@end

NS_ASSUME_NONNULL_END
