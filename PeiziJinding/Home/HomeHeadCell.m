//
//  HomeHeadCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/3.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "HomeHeadCell.h"

@interface HomeHeadCell ()
@property(nonatomic,strong)UIImageView *moreImgview;
@property(nonatomic,strong)UIView *lineView;
@end

@implementation HomeHeadCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dxlayoutSubView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)dxlayoutSubView{
    [self.contentView addSubview:self.mainLabel];
    [self.contentView addSubview:self.moreImgview];
    [self.contentView addSubview:self.lineView];
    [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(15);
    }];
    [self.moreImgview  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).inset(10);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10);
        make.bottom.equalTo(self.contentView);
        make.right.equalTo(self.contentView).inset(10);
        make.height.mas_equalTo(0.5);
    }];
}

- (UILabel *)mainLabel {
    if(!_mainLabel){
        _mainLabel = [[UILabel alloc]init];
        _mainLabel.text = @"精选期货要闻";
        _mainLabel.textColor = MainColor;
        _mainLabel.font = [UIFont systemFontOfSize:15];
        _mainLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _mainLabel;
}

- (UIImageView *)moreImgview{
    if(!_moreImgview){
        _moreImgview = [[UIImageView alloc]init];
        _moreImgview.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [_moreImgview addGestureRecognizer:tap];
        _moreImgview.image = [UIImage imageNamed:@"homeMoreIcon"];
    }
    return _moreImgview;
}

- (UIView *)lineView{
    if(!_lineView){
        
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _lineView;
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"more" object:nil];
}
@end
