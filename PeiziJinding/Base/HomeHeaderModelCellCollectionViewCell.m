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
        self.contentView.backgroundColor = [UIColor redColor];
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
        _sdcycleScView = [SDCycleScrollView  cycleScrollViewWithFrame:self.contentView.bounds imageURLStringsGroup:@[@"https://tva1.sinaimg.cn/large/007S8ZIlly1ghdkmarkhsj30hs0a6mxf.jpg",@"https://tva1.sinaimg.cn/large/007S8ZIlly1ghdkoym2cbj30dw0afab4.jpg",@"https://tva1.sinaimg.cn/large/007S8ZIlly1gha68zmweij31i20kitfs.jpg"]];
        _sdcycleScView.placeholderImage = [UIImage imageNamed:@"stock_home_banner1"];
         HomeModel *homeHModel =  (HomeModel *)self.model;
        //_sdcycleScView.imageURLStringsGroup = [homeHModel.imgUrlArr copy];
        _sdcycleScView.autoScrollTimeInterval = 2;
        _sdcycleScView.clickItemOperationBlock = ^(NSInteger currentIndex) {
            [[NSNotificationCenter defaultCenter]postNotificationName:@"clickBanner" object:nil];
        };
    }
    return _sdcycleScView;
}


@end
