//
//  CommItemDataCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommItemDataCell.h"

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
@property(nonatomic,strong)UIImageView *reviewIcon; //评论
@property(nonatomic,strong)UIImageView *spotImgView;//点赞
@property(nonatomic,strong)UIView *lineView;//分割线
@property(nonatomic,strong)UILabel *usrNameLabel;
@property(nonatomic,strong)UILabel *reContentLabel; //追述
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
        
    }
    return _userNameLabel;
}

@end
