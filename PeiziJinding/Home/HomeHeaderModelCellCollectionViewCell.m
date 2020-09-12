//
//  HomeHeaderModelCellCollectionViewCell.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "HomeHeaderModelCellCollectionViewCell.h"
#import "HomeModel.h"
@implementation HomeHeaderModelCellCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if(self == [super initWithFrame:frame]){
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
        [self dx_layoutSubView];
    }
    return self;
}

- (void)dx_layoutSubView{
    [self.contentView addSubview:self.sdcycleScView];
}

#pragma mark - getter

/**
 
1   https://tva1.sinaimg.cn/large/007S8ZIlly1gha65w2lqkj31k60iogth.jpg
 
    https://tva1.sinaimg.cn/large/007S8ZIlly1gha688mjwwj31cw0msn4r.jpg
 
    https://tva1.sinaimg.cn/large/007S8ZIlly1gha68zmweij31i20kitfs.jpg
 */
- (SDCycleScrollView *)sdcycleScView
{
    //@[@"https://www.jdpz888.com/h5/",@"https://www.jdpz888.com/h5/",@"https://tva1.sinaimg.cn/large/007S8ZIlly1gha68zmweij31i20kitfs.jpg"]
    
    if(!_sdcycleScView){
        _sdcycleScView = [SDCycleScrollView  cycleScrollViewWithFrame:CGRectMake(10, 5, Scr_w-20, CGRectGetHeight(self.contentView.bounds)-10) imageURLStringsGroup:@[@"https://tva1.sinaimg.cn/large/007S8ZIlly1ghh2zx3e34j30rs0h6wo0.jpg",@"https://tva1.sinaimg.cn/large/007S8ZIlly1ghh31cu1r8j30ku0astaz.jpg",@"https://tva1.sinaimg.cn/large/007S8ZIlly1ghh33aqfkqj30m40b0dkv.jpg"]];
        _sdcycleScView.placeholderImage = [UIImage imageNamed:@"stock_home_banner1"];
         //HomeModel *homeHModel =  (HomeModel *)self.model;
        //@[@"中俄天然气管道投入生产，我国取消澳大利亚大量天然气订单",,@"黄金价格到底会涨到什么位置？每盎司能涨到3000美元吗",@"湖北创新“四种模式” 深耕水稻全产业链"]
        _sdcycleScView.titlesGroup = @[@"中俄天然气管道投入生产，我国取消澳大利亚大量天然气订单",@"黄金价格到底会涨到什么位置？每盎司能涨到3000美元吗",@"湖北创新“四种模式” 深耕水稻全产业链"];
        //_sdcycleScView.imageURLStringsGroup = [homeHModel.imgUrlArr copy];
        _sdcycleScView.autoScrollTimeInterval = 2;
        _sdcycleScView.layer.cornerRadius = 10;
        _sdcycleScView.clipsToBounds = YES;
        _sdcycleScView.showPageControl = NO;
        //_sdcycleScView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _sdcycleScView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
        _sdcycleScView.clickItemOperationBlock = ^(NSInteger currentIndex) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"clickBanner" object:nil userInfo:@{@"index":@(currentIndex)}];
          
        };
    }
    return _sdcycleScView;
}


@end
