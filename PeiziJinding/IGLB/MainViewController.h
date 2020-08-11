//
//  MainViewController.h
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit/IGListAdapterDataSource.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController<IGListAdapterDataSource,UIScrollViewDelegate,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property(nonatomic,strong)UICollectionView *mainCollectionView;
@property(nonatomic,strong)IGListAdapter *adapter;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UILabel *nodataLabel;
@property(nonatomic,strong)UIImageView *haveNoDataView;
- (void)dxConfigData;
- (void)dxLayoutSubview;
@end

NS_ASSUME_NONNULL_END
