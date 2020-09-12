//
//  CommunityVC.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommunityVC.h"
#import "MarketTabView.h"
#import "CommItemDataCell.h"
#import "CommuHotLineViewController.h"
#import "CommuSayViewController.h"
#import "ComAttenViewController.h"
@interface CommunityVC ()<MarketTapClickprotocol,UIScrollViewDelegate>
@property(nonatomic,strong)MarketTabView *tabView;
@property(nonatomic,strong)UIScrollView *mainScrollView;
@property(nonatomic,assign)CGFloat tabbarH;
@property(nonatomic,assign)CGFloat navigHs;
@end

@implementation CommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabbarH  = self.tabBarController.tabBar.frame.origin.y;
    self.navigHs  = self.navigationController.navigationBar.frame.size.height + statusH;
    self.edgesForExtendedLayout = UIRectEdgeNone;
     self.view.backgroundColor = [UIColor colorWithHexString:@"#E2E2E2"];
     [self dx_layoutSubView];
}


- (void)dx_layoutSubView{
    [self.view addSubview:self.mainScrollView];
    self.tabView.frame = CGRectMake(0, 0, Scr_w, 45);
    [self.view addSubview:self.tabView];
    CommuHotLineViewController *commiHotC = [[CommuHotLineViewController alloc]init];
    commiHotC.view.frame = CGRectMake(0, 0, Scr_w, self.mainScrollView.frame.size.height);
    [self.mainScrollView addSubview:commiHotC.view];
    CommuSayViewController *commSay = [[CommuSayViewController alloc]init];
    commSay.view.frame = CGRectMake(Scr_w, 0, Scr_w, self.mainScrollView.frame.size.height);
    [self.mainScrollView addSubview:commSay.view];

    ComAttenViewController *attenV =[[ComAttenViewController alloc]init];
    attenV.view.frame = CGRectMake(2*Scr_w, 0, Scr_w, self.mainScrollView.frame.size.height);
    [self.mainScrollView addSubview:attenV.view];
    [self addChildViewController:commiHotC];
    [self addChildViewController:commSay];
    [self addChildViewController:attenV];
}

- (void)dxConfigData{
    [self.view addSubview:self.tabView];
    [self.tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.top.equalTo(self.view);
        make.height.mas_equalTo(45);
    }];
}


- (MarketTabView *)tabView{
    if(!_tabView){
        _tabView = [[MarketTabView alloc]initWithDataArr:@[@"热点",@"说说",@"关注"]];
        _tabView.backgroundColor = [UIColor colorWithHexString:@"#E7E8E8"];
        _tabView.delegate = self;
    }
    return _tabView;
}

- (UIScrollView *)mainScrollView{
    if(!_mainScrollView){
       
        _mainScrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(0,45, Scr_w, self.tabbarH - self.navigHs - 45)];
        _mainScrollView.delegate = self;
        _mainScrollView.bounces = NO;
        _mainScrollView.contentSize = CGSizeMake(Scr_w * 4, 0);
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
       // _mainScrollView.backgroundColor = [UIColor redColor];
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.scrollEnabled = YES;
    }
    return _mainScrollView;
}

#pragma mark - MarketTabLCickDelegate
- (MarketTabView *)marketTabItemClick:(MarketTabView *)tabView item:(id)item index:(NSInteger)index{
    CGPoint position = CGPointMake(index * Scr_w, 0);
    [self.mainScrollView setContentOffset:position animated:YES];
    
    return self.tabView;
}

#pragma mark -UIscrViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page =  scrollView.contentOffset.x/Scr_w;
   
    [self.tabView selectAtIndex:page];
}


@end
