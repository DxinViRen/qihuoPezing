//
//  LoginCell.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/30.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "LoginCell.h"

@implementation LoginCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSubview];
        self.contentView.backgroundColor  = MainColor;
        self.contentView.layer.cornerRadius = 6;
    }
    return self;
}

- (void)dx_layoutSubview{
    [self.contentView addSubview:self.tiLabel];
    [self.tiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
}

- (UILabel *)tiLabel{
    if(!_tiLabel){
        _tiLabel = [[UILabel alloc]init];
        _tiLabel.text = @"退出登录";
        _tiLabel.textColor = [UIColor whiteColor];
        
    }
    return _tiLabel;
}

@end
