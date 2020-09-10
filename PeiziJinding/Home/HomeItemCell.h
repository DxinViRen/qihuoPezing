//
//  HomeItemCell.h
//  PeiziJinding
//
//  Created by D.xin on 2020/8/3.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MainCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeItemCell : MainCollectionViewCell
@property (nonatomic,strong)UIImageView *myIngolView;  //我的积分
@property (nonatomic,strong)UIImageView *myCollected;  //我的收藏
//@property (nonatomic,strong)UILabel *ingolLabel;       //我的积分显示
//@property (nonatomic,strong)UILabel *collectLabel;     //我的收藏显示
@property (nonatomic,strong)UIImageView *daySign;      //每日签到
//@property (nonatomic,strong)UILabel *signLabel;    //显示签到
//@property (nonatomic,strong)UILabel *exchangeLabel;    //兑换显示
@property (nonatomic,strong)UIImageView *exchangeImgView; //积分兑换list
@end

NS_ASSUME_NONNULL_END
