//
//  CommunityVC.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommunityVC.h"
#import "MarketTabView.h"
@interface CommunityVC ()<MarketTapClickprotocol>
@property(nonatomic,strong)MarketTabView *tabView;
@end

@implementation CommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *secC = [[StorkSectionController alloc]init];
    secC.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    
    secC.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        
    };
    
    return secC;
}
- (void)dxConfigData{
    [self.view addSubview:self.tabView];
    [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.top.equalTo(self.view);\
        make.height.mas_equalTo(45);
    }];
    [self.mainCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.tabView);
        make.top.equalTo(self.tabView);
    }];
}


- (MarketTabView *)tabView{
    if(!_tabView){
        _tabView = [[MarketTabView alloc]initWithDataArr:@[@"热点",@"说说",@"关注"]];
        _tabView.delegate = self;
    }
    return _tabView;
}


#pragma mark - MarketTabLCickDelegate
- (MarketTabView *)marketTabItemClick:(MarketTabView *)tabView item:(id)item index:(NSInteger)index{
    
    return self.tabView;
}
@end
