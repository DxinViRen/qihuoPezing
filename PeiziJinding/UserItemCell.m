//
//  UserItemCell.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "UserItemCell.h"

@implementation UserItemCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dxLayoutSubView];
        self.contentView.backgroundColor  = [UIColor whiteColor];
    }
    return self;
}

- (void)dxLayoutSubView{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titLabel];
    [self.contentView addSubview:self.toplineView];
    [self.contentView addSubview:self.botLineView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(15);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
    
    [self.titLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.iconImageView.mas_right).offset(20);
    }];
    
    [self.toplineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.height.mas_equalTo(0.8);
        make.left.equalTo(self.contentView).inset(8);
        make.right.equalTo(self.contentView).inset(8);
    }];
    
    [self.botLineView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.bottom.equalTo(self.contentView);
           make.height.mas_equalTo(0.8);
           make.left.equalTo(self.contentView).inset(8);
           make.right.equalTo(self.contentView).inset(8);
       }];
}

- (void)setModel:(id<MainCellModelProtocol>)model{
    self.iconImageView.image = [UIImage imageNamed:model.extra[@"img"]];
    self.titLabel.text = model.extra[@"title"];
}

- (UIImageView *)iconImageView{
    if(!_iconImageView){
        
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}


- (UILabel *)titLabel{
    if(!_titLabel){
        _titLabel = [[UILabel alloc]init];
        _titLabel.font = [ UIFont systemFontOfSize:15];
        _titLabel.textColor =  HeadTextColor;
    }
    return _titLabel;
}

- (UIView *)toplineView{
    if(!_toplineView){
        
        _toplineView = [[UIView alloc]init];
        _toplineView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    }
    return _toplineView;
}

- (UIView *)botLineView{
    if(!_botLineView){
        
        _botLineView = [[UIView alloc]init];
        _botLineView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    }
    return _botLineView;
}

@end
