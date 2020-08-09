//
//  MarketItemShowView.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketItemShowView.h"

@implementation MarketItemShowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self dx_layoutSubView];
    }
    return self;
}

- (void)dx_layoutSubView{
    [self addSubview:self.nameLabel];
    [self addSubview:self.priceLabel];
    [self addSubview:self.numLabel];
    NSArray *viewArr = @[self.nameLabel,self.priceLabel,self.numLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.height.equalTo(self);
       }];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.height.equalTo(self);
       }];
    [viewArr  mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
}
- (UILabel *)nameLabel{
    if(!_nameLabel){
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"名称";
        _nameLabel.textColor = MainColor;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}
- (UILabel *)priceLabel{
    if(!_priceLabel){
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        _priceLabel.text = @"最新价格";
        _priceLabel.textColor = MainColor;
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}
- (UILabel *)numLabel{
    if(!_numLabel){
        _numLabel = [[UILabel alloc]init];
        _numLabel.font = [UIFont systemFontOfSize:13];
        _numLabel.text = @"成交量";
        _numLabel.textColor = MainColor;
        _numLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numLabel;
}
@end
