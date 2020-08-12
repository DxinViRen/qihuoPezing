//
//  ComDetailCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "ComDetailCell.h"
#import <YYText.h>
@interface ComDetailCell ()
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UILabel *nameLabe;
@property(nonatomic,strong)UIButton *attensionBtn;
@property(nonatomic,strong)YYLabel *contentLabel;
@property(nonatomic,strong)UIImageView *contentImageView;
@property(nonatomic,strong)UILabel *riskLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *timeLable;
@property(nonatomic,strong)UIImageView *spotIcon;

@end

@implementation ComDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSubview];
    }
    return self;
}

- (void)dx_layoutSubview{
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.nameLabe];
    [self.contentView addSubview:self.attensionBtn];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.contentImageView];
    [self.contentView addSubview:self.riskLabel];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.spotIcon];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(self.contentView).inset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.nameLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView).offset(10);
        make.top.equalTo(self.headImageView);
    }];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabe);
        make.top.equalTo(self.nameLabe.mas_bottom).offset(8);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView);
        make.top.equalTo(self.headImageView.mas_bottom).offset(15);
    }];
}

- (UIImageView *)headImageView{
    if(!_headImageView){
        _headImageView = [[UIImageView alloc]init];
        _headImageView.layer.cornerRadius = 20;
        _headImageView.clipsToBounds = YES;
    }
    return _headImageView;
}

- (UILabel *)nameLabe{
    if(!_nameLabe){
        _nameLabe = [[UILabel alloc]init];
        _nameLabe.font = [UIFont systemFontOfSize:15];
        _nameLabe.textColor = [UIColor colorWithHexString:@"#E2D0AA"];
        _nameLabe.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabe;
}

- (UILabel *)timeLable{
    if(!_timeLable){
        _timeLable = [[UILabel alloc]init];
        _timeLable = [[UILabel alloc]init];
        _timeLable.font = [UIFont systemFontOfSize:10];
        _timeLable.textColor = [UIColor colorWithHexString:@"#9E9FA0"];
    }
    
    return _timeLable;
}

- (YYLabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[YYLabel alloc]init];
       // _contentLabel.backgroundColor = [UIColor cyanColor];
        _contentLabel.font = [UIFont systemFontOfSize:17];
        _contentLabel.textColor = MainColor;
        _contentLabel.numberOfLines = 0;
        _contentLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
    }
    return _contentLabel;
}

- (UIImageView *)contentImageView{
    if(!_contentImageView){
        _contentImageView = [[UIImageView alloc]init];
        _contentImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _contentImageView;
}

- (UILabel *)riskLabel{
    if(!_riskLabel){
        _riskLabel = [[UILabel  alloc]init];
        _riskLabel.font = [UIFont systemFontOfSize:13];
        _riskLabel.textColor = [UIColor colorWithHexString:@"#E2D0AA"];
        _riskLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _riskLabel;
}

- (UIView *)lineView{
    if(!_lineView){
        
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#E2D0AA"];
    }
    return _lineView;
}

- (UIImageView *)spotIcon{
    if(!_spotIcon){
        
        _spotIcon = [[UIImageView alloc]init];
        _spotIcon.image = [UIImage imageNamed:@""];
    }
    return _spotIcon;
}

- (UIButton *)attensionBtn{
    if(!_attensionBtn){
        _attensionBtn = [[UIButton alloc]init];
        [_attensionBtn setTitle:@"关注" forState:UIControlStateNormal];
        [_attensionBtn setTitleColor:MainColor forState:UIControlStateNormal];
        //_attentionBtn.backgroundColor = [UIColor redColor];
        _attensionBtn.layer.cornerRadius = 3;
        _attensionBtn.layer.borderWidth = 0.8;
        _attensionBtn.layer.borderColor = MainColor.CGColor
        ;        [_attensionBtn addTarget:self
                          action:@selector(attenAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _attensionBtn;
}


- (void)attenAction:(UIButton *)bt{
//    [[LoginManager shareInsetance] checkLogin:^{
//        self.hub = [MBProgressHUD showMessage:@"请稍等"];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.hub hideAnimated:YES];
//            if(self.dataModel.pre_isAtten){
//                [self.attentionBtn setTitleColor:MainColor forState:UIControlStateNormal];
//                self.attentionBtn.layer.borderWidth = 0.8;
//                self.attentionBtn.layer.borderColor = MainColor.CGColor;
//                self.attentionBtn.layer.cornerRadius = 3;
//            }else{
//                [self.attentionBtn setTitleColor:[UIColor colorWithHexString:@"#d81e06"] forState:UIControlStateNormal];
//                self.attentionBtn.layer.borderWidth = 0.8;
//                self.attentionBtn.layer.borderColor = [UIColor colorWithHexString:@"#d81e06"].CGColor;
//                self.attentionBtn.layer.cornerRadius = 3;
//            }
//            self.dataModel.pre_isAtten = !self.dataModel.pre_isAtten;
//         });
//    }];
}


@end
