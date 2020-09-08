//
//  HomeItemCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/3.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "HomeItemCell.h"

@implementation HomeItemCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layouytSubView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)dx_layouytSubView{
    [self.contentView addSubview:self.myCollected];
    [self.contentView addSubview:self.myIngolView];
    [self.contentView addSubview:self.ingolLabel];
    [self.contentView addSubview:self.collectLabel];
    [self.contentView addSubview:self.signLabel];
    [self.contentView addSubview:self.daySign];
    [self.contentView addSubview:self.exchangeImgView];
    [self.contentView addSubview:self.exchangeLabel];
    
    NSArray *viewArr = @[self.daySign,self.myIngolView,self.myCollected,self.exchangeImgView];
    [self.daySign mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contentView).inset(15);
    }];
    
    
//    NSArray *labelArr = @[self.signLabel,self.ingolLabel,self.collectLabel,self.exchangeLabel];
    
    
    [viewArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:70 leadSpacing:40 tailSpacing:40];
    
    [viewArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.daySign.mas_width);
        make.top.equalTo(self.contentView).inset(15);
    }];
    
  
    [self.signLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.daySign);
        make.top.equalTo(self.daySign.mas_bottom).offset(10);
    }];
    
    [self.collectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerX.equalTo(self.myCollected
                                );
        make.top.equalTo(self.myCollected.mas_bottom).offset(10);
       }];
    
    [self.ingolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.myIngolView);
        make.top.equalTo(self.myIngolView.mas_bottom).offset(10);
    }];
    
    [self.exchangeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerX.equalTo(self.exchangeImgView);
        make.top.equalTo(self.exchangeImgView.mas_bottom).offset(10);
       }];
   
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"itemClick" object:nil userInfo:@{@"tag":@(tap.view.tag)}];
}

- (UIImageView *)myIngolView{
    if(!_myIngolView){
        _myIngolView = [[UIImageView alloc]init];
        _myIngolView.userInteractionEnabled = YES;
        _myIngolView.tag = 200;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tapAction:)];
        [_myIngolView addGestureRecognizer:tap];
        _myIngolView.image = [UIImage imageNamed:@"LessonIcon"];
    }
    return _myIngolView;
}

- (UIImageView *)myCollected{
    if (!_myCollected) {
        _myCollected = [[UIImageView alloc]init];
        _myCollected.userInteractionEnabled = YES;
        _myCollected.tag = 300;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tapAction:)];
        [_myCollected addGestureRecognizer:tap];
        _myCollected.image = [UIImage imageNamed:@"NewsIcon"];
        //_myCollected.backgroundColor = [UIColor redColor];
    }
    return _myCollected;
}

- (UILabel *)ingolLabel{
    if(!_ingolLabel){
        _ingolLabel = [[UILabel alloc]init];
        _ingolLabel.tag = 2000;
        _ingolLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tapAction:)];
        [_ingolLabel addGestureRecognizer:tap];
        _ingolLabel.font  =[UIFont systemFontOfSize:15];
        _ingolLabel.text = @"期货学堂";
        _ingolLabel.textColor = MainColor;
        [_ingolLabel sizeToFit];
    }
    return _ingolLabel;
}

- (UILabel *)collectLabel{
    if(!_collectLabel){
        _collectLabel = [[UILabel alloc]init];
        _collectLabel.tag = 3000;
        _collectLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tapAction:)];
        [_collectLabel addGestureRecognizer:tap];
        _collectLabel.font  =[UIFont systemFontOfSize:15];
        _collectLabel.text = @"热门资讯";
        _collectLabel.textColor = MainColor;
        [_collectLabel sizeToFit];
    }
    return _collectLabel;
}

- (UILabel *)signLabel{
    if(!_signLabel){
        _signLabel = [[UILabel alloc]init];
        _signLabel.textColor =MainColor;
        _signLabel.tag = 100;
        _signLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tapAction:)];
        [_signLabel addGestureRecognizer:tap];
        _signLabel.font = [UIFont systemFontOfSize:15];
        _signLabel.text = @"财经日历";
        _signLabel.textColor = MainColor;
        _signLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _signLabel;
}

- (UIImageView *)daySign{
    if(!_daySign){
        _daySign = [[UIImageView alloc]init];
        _daySign.tag = 100;
        _daySign.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tapAction:)];
        [_daySign addGestureRecognizer:tap];
        _daySign.image  = [UIImage imageNamed:@"calIoconHomeItem"];
        //_daySign.backgroundColor = [UIColor
                                   // orangeColor];
    }
    return _daySign;
}

- (UILabel *)exchangeLabel{
    if(!_exchangeLabel){
        _exchangeLabel = [[UILabel alloc]init];
        _exchangeLabel.userInteractionEnabled = YES;
        _exchangeLabel.textColor = MainColor;
        _exchangeLabel.tag = 4000;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tapAction:)];
        [_exchangeLabel addGestureRecognizer:tap];
        _exchangeLabel.font = [UIFont systemFontOfSize:15];
        _exchangeLabel.text = @"我的收藏";
        _exchangeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _exchangeLabel;
}

- (UIImageView *)exchangeImgView
{
    if(!_exchangeImgView){
        _exchangeImgView = [[UIImageView alloc]init];
        _exchangeImgView.userInteractionEnabled = YES;
        _exchangeImgView.tag = 4000;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(tapAction:)];
        [_exchangeImgView addGestureRecognizer:tap];
        _exchangeImgView.image = [UIImage imageNamed:@"mycolectIc"];
        //_exchangeImgView.backgroundColor = [UIColor cyanColor];
    }
    return _exchangeImgView;
}



@end
