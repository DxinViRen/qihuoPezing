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
    
    
    [viewArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:10 tailSpacing:10];
    
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
    
    

   
   
//
   
    
    
    
    
   
}

- (UIImageView *)myIngolView{
    if(!_myIngolView){
        _myIngolView = [[UIImageView alloc]init];
        _myIngolView.backgroundColor = [UIColor greenColor];
    }
    return _myIngolView;
}

- (UIImageView *)myCollected{
    if (!_myCollected) {
        _myCollected = [[UIImageView alloc]init];
        _myCollected.backgroundColor = [UIColor redColor];
    }
    return _myCollected;
}

- (UILabel *)ingolLabel{
    if(!_ingolLabel){
        _ingolLabel = [[UILabel alloc]init];
        _ingolLabel.font  =[UIFont systemFontOfSize:15];
        _ingolLabel.text = @"我的积分";
        _ingolLabel.textColor = MainColor;
        [_ingolLabel sizeToFit];
    }
    return _ingolLabel;
}

- (UILabel *)collectLabel{
    if(!_collectLabel){
        _collectLabel = [[UILabel alloc]init];
        _collectLabel.font  =[UIFont systemFontOfSize:15];
        _collectLabel.text = @"我的收藏";
        _collectLabel.textColor = MainColor;
        [_collectLabel sizeToFit];
    }
    return _collectLabel;
}

- (UILabel *)signLabel{
    if(!_signLabel){
        _signLabel = [[UILabel alloc]init];
        _signLabel.textColor =MainColor;
        _signLabel.font = [UIFont systemFontOfSize:15];
        _signLabel.text = @"今日签到";
        _signLabel.textColor = MainColor;
        _signLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _signLabel;
}

- (UIImageView *)daySign{
    if(!_daySign){
        
        _daySign = [[UIImageView alloc]init];
        _daySign.backgroundColor = [UIColor
                                    orangeColor];
    }
    return _daySign;
}

- (UILabel *)exchangeLabel{
    if(!_exchangeLabel){
        _exchangeLabel = [[UILabel alloc]init];
        _exchangeLabel.textColor = MainColor;
        _exchangeLabel.font = [UIFont systemFontOfSize:15];
        _exchangeLabel.text = @"兑换记录";
        _exchangeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _exchangeLabel;
}

- (UIImageView *)exchangeImgView
{
    if(!_exchangeImgView){
        _exchangeImgView = [[UIImageView alloc]init];
        _exchangeImgView.backgroundColor = [UIColor cyanColor];
    }
    return _exchangeImgView;
}



@end
