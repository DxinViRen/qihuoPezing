//
//  MarketDataView.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketItemModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MarketDataView : UIView<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTableView;
@property(nonatomic,strong)MarketItemModel *model;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,assign)CGSize bsize;
- (void)reloadData;
- (instancetype)initWithSize:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
