//
//  CommItemDataCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommItemDataCell.h"
#import <MBProgressHUD/MBProgressHUD.h>
@interface CommItemDataCell ()
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIButton *attentionBtn;
@property(nonatomic,strong)UILabel *tagLabel;//标签
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView *contenImgView;
@property(nonatomic,strong)UIButton *shareBtn; //分享
@property(nonatomic,strong)UILabel  *shareTextLabel;
@property(nonatomic,strong)UIButton *reviewIcon; //评论
@property(nonatomic,strong)UILabel *reviewLabel;
@property(nonatomic,strong)UIButton *spotImgView;//点赞
@property(nonatomic,strong)UILabel  *spotLabel;
@property(nonatomic,strong)UIView *lineView;//分割线
@property(nonatomic,strong)UILabel *usrNameLabel;
@property(nonatomic,strong)UILabel *reContentLabel;
@property(nonatomic,strong)MBProgressHUD *hub;
//追述
@end

@implementation CommItemDataCell

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

}

- (UIImageView *)headImageView{
    if(!_headImageView){
        
        _headImageView = [[UIImageView alloc]init];
        _headImageView.layer.cornerRadius = 20;
        _headImageView.clipsToBounds = YES;
    }
    return _headImageView;
}

- (UILabel *)userNameLabel{
    if(!_userNameLabel){
        _userNameLabel = [[UILabel alloc]init];
        _userNameLabel.font = [UIFont systemFontOfSize:15];
        _userNameLabel.textColor = [UIColor colorWithHexString:@"#333435"];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        }
    return _userNameLabel;
}

- (UILabel *)timeLabel{
    if(!_timeLabel){
        
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textColor = [UIColor colorWithHexString:@"#9E9FA0"];
    }
    return _timeLabel;
}

- (UILabel *)tagLabel{
    if(!_tagLabel){
        
        _tagLabel = [[UILabel alloc]init];
        _tagLabel.font = [UIFont systemFontOfSize:17];
        _tagLabel.textColor = [UIColor colorWithHexString:@"#EE842E"];
        _tagLabel.textAlignment = NSTextAlignmentLeft;
        [_tagLabel sizeToFit];
    }
    return _tagLabel;
}

- (UILabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:17];
        _contentLabel.textColor = [UIColor colorWithHexString:@"#323334"];
        _contentLabel.numberOfLines = 0;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
    }
    return _contentLabel;
}

- (UIImageView *)contenImgView{
    if(!_contenImgView){
        _contenImgView = [[UIImageView alloc]init];
    }
    return _contenImgView;
}

- (UIButton *)attentionBtn{
    if(!_attentionBtn){
        
        _attentionBtn = [[UIButton alloc]init];
        [_attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
        [_attentionBtn addTarget:self
                          action:@selector(attenAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _attentionBtn;
}

- (void)attenAction:(UIButton *)btn{
    
    self.hub = [MBProgressHUD showMessage:@"请稍等"];
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [self.hub hideAnimated:YES];
       });

}

- (UIButton *)shareBtn{
    if(!_shareBtn){
        
        _shareBtn = [[UIButton alloc]init];
        [_shareBtn setImage:[UIImage imageNamed:@"share_btn"] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

- (UILabel *)shareTextLabel{
    if(!_shareTextLabel){
        
        _shareTextLabel = [[UILabel alloc]init];
        _shareTextLabel.text = @"分享";
        _shareTextLabel.textColor = [UIColor colorWithHexString:@"#333435"];
        _shareTextLabel.font = [UIFont systemFontOfSize:15];
        [_shareTextLabel sizeToFit];
    }
    return _shareTextLabel;
}

- (void)shareAction:(UIButton *)share{
    
}

- (UIButton *)reviewIcon{
    if(!_reviewIcon){
        
        _reviewIcon = [[UIButton alloc]init];
        [_reviewIcon setImage:[UIImage imageNamed:@"review_icon"] forState:UIControlStateNormal];
        [_reviewIcon addTarget:self action:@selector(reviewACtion:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reviewIcon;
}

- (UILabel *)reviewLabel{
    if(!_reviewLabel){
        
        _reviewLabel = [[UILabel alloc]init];
        _reviewLabel.text = @"评论";
        _reviewLabel.font = [UIFont systemFontOfSize:15];
        _reviewLabel.textColor = [UIColor colorWithHexString:@"#333435"];
    }
    return _reviewLabel;
}


- (void)reviewACtion:(UIButton *)btn{
    
}

- (UIButton *)spotImgView{
    if(!_spotImgView){
        
        _spotImgView = [[UIButton alloc]init];
        [_spotImgView setImage:[UIImage imageNamed:@"dianzhan_u"] forState:UIControlStateNormal];
        [_spotImgView addTarget:self action:@selector(spotAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _spotImgView;
}

- (UILabel *)spotLabel{
    if(!_spotLabel){
        _spotLabel = [[UILabel alloc]init];
        _reviewLabel.text = @"点赞";
        _reviewLabel.font = [UIFont systemFontOfSize:15];
        _reviewLabel.textColor = [UIColor colorWithHexString:@"#333435"];
    }
    return _spotLabel;
}

- (void)spotAction:(UIButton *)spot{
    
}

- (UIView *)lineView{
    if(!_lineView){
        
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#E6E7E8"];
    }
    return _lineView;
}

- (UILabel *)usrNameLabel{
    if(!_usrNameLabel){
        _usrNameLabel = [[UILabel alloc]init];
        _usrNameLabel.font = [UIFont systemFontOfSize:15];
        _usrNameLabel.textColor = [UIColor colorWithHexString:@"#333435"];
        _usrNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _usrNameLabel;
}

@end
