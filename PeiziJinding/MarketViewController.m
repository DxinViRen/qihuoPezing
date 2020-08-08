//
//  MarketViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/6.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketViewController.h"
#import "MarketTabView.h"
@interface MarketViewController ()<MarketTapClickprotocol>
@property(nonatomic,strong)MarketTabView *tabView;
@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dx_layoutSubView];
}

- (void)dx_layoutSubView{
    
}

- (MarketTabView *)tabViewP{
    if(!_tabView){
        _tabView = [[MarketTabView  alloc]initWithDataArr:@[]];
        _tabView.delegate = self;
    }
    return _tabView;
}



#pragma mark - MarketTabViewProtocol
- (MarketTabView *)marketTabItemClick:(MarketTabView *)tabView item:(id)item index:(NSInteger)index{
    
    
    return self.tabView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
