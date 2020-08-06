//
//  HomegyNotiCell.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "HomegyNotiCell.h"

@implementation HomegyNotiCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self dx_layoutSubview];
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    }
    return self;
}

- (void)dx_layoutSubview{
    [self.contentView addSubview:self.dxTitleLabel];
    [self.contentView addSubview:self.dxImageView];
    [self.dxTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(10);
       
    }];
    
    
    [self.dxImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).inset(10);
        make.size.mas_equalTo(CGSizeMake(80, 40));
    }];
    
}

- (void)setModel:(HomeModel *)model{
    _model = model;
    self.dxTitleLabel.text = _model.extra[@"title"];
    self.dxImageView.image = [UIImage imageNamed:_model.extra[@"img"]];
    //self.contentView.backgroundColor = [UIColor colorWithHexString:_model.extra[@"color"]];
}

- (UILabel *)dxTitleLabel{
    if(!_dxTitleLabel){
        _dxTitleLabel = [[UILabel alloc]init];
        _dxTitleLabel.textColor = MainColor;
       // _dxTitleLabel.backgroundColor  = [UIColor redColor];
        _dxTitleLabel.text = @"dsdasdasdasd";
        _dxTitleLabel.font = [UIFont systemFontOfSize:15];
        [_dxTitleLabel sizeToFit];
    }
    return _dxTitleLabel;
}

- (UIImageView *)dxImageView{
    if(!_dxImageView){
        _dxImageView = [[UIImageView alloc]init];
    }
    return _dxImageView;
}

@end
