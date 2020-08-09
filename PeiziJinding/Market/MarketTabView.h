//
//  MarketTabView.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MarketTabView;
@protocol MarketTapClickprotocol <NSObject>

@optional
- (MarketTabView *)marketTabItemClick:(MarketTabView *)tabView item:(id)item index:(NSInteger)index;
@end

@interface MarketTabView : UIView

@property(nonatomic,weak)id<MarketTapClickprotocol>delegate;
- (void)selectAtIndex:(NSInteger)index;

- (instancetype)initWithDataArr:(NSArray *)titleArr;

@end

NS_ASSUME_NONNULL_END
