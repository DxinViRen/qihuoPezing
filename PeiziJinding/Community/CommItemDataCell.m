//
//  CommItemDataCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/9.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommItemDataCell.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "CommDataModel.h"
#import <YYText.h>
@interface CommItemDataCell ()
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIButton *attentionBtn;
@property(nonatomic,strong)UILabel *tagLabel;//标签
@property(nonatomic,strong) YYLabel*contentLabel;
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
@property(nonatomic,strong)UIView *blanView;
@property(nonatomic,strong)UIView *bView;
@property(nonatomic,strong)CommDataModel *dataModel;
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
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)dx_layoutSubview{
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.attentionBtn];
    [self.contentView addSubview:self.tagLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.contenImgView];
    [self.contentView addSubview:self.shareBtn];
    [self.contentView addSubview:self.shareTextLabel];
    [self.contentView addSubview:self.reviewIcon];
    [self.contentView addSubview:self.reviewLabel];
    [self.contentView addSubview:self.spotImgView];
    [self.contentView addSubview:self.spotLabel];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.usrNameLabel];
    [self.contentView addSubview:self.reContentLabel];
    [self.contentView addSubview:self.bView];
    //[self.contentView addSubview:self.blanView];
    
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.top.equalTo(self.contentView).inset(7);
    }];
    
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).inset(11);
        make.left.equalTo(self.headImageView.mas_right).offset(10);
       
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.top.equalTo(self.userNameLabel.mas_bottom).offset(8);
    }];
    
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
    }];
    
    [self.contenImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView).inset(10);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(15);
        make.size.mas_equalTo(CGSizeMake(95, 140));
    }];
    
    [self.attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImageView);
        make.right.equalTo(self.contentView).inset(10);
        make.size.mas_equalTo(CGSizeMake(71, 24));

    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10);
        make.right.equalTo(self.contentView).inset(10);
        make.bottom.equalTo(self.contentView).inset(45);
        make.height.mas_equalTo(0.8);
    }];

    
  [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(Scr_w*(200.0/375));
        make.bottom.equalTo(self.lineView.mas_top).offset(-5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];

    [self.shareTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.shareBtn);
        make.left.equalTo(self.shareBtn.mas_right).offset(3);
    }];

    [self.reviewIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.shareTextLabel);
        make.left.equalTo(self.shareTextLabel.mas_right).offset(Scr_w *(15/375.0));
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];

    [self.reviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.reviewIcon);
        make.left.equalTo(self.reviewIcon.mas_right).offset(3);
    }];
//
    [self.spotImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.reviewLabel.mas_right).offset(Scr_w *(15/375.0));
        make.centerY.equalTo(self.reviewLabel);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
//
    [self.spotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.spotImgView);
        make.left.equalTo(self.spotImgView.mas_right).offset(3);
    }];
//
//
   
    

//
//    [self.blanView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.and.right.and.bottom.equalTo(self.contentView);
//        make.top.equalTo(self.lineView.mas_bottom);
//    }];
}

- (void)setModel:(id<MainCellModelProtocol>)model{
   
    self.dataModel = (CommDataModel *)model;
    //self.model = dataModel;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:CommitBaseImgURL,self.dataModel.say.senderPhoto]] placeholderImage:[UIImage imageNamed:@"default_headImg"]];
    CGFloat textH = [DateTool
                     getStringHeightWithText:self.dataModel.say.content font:[UIFont systemFontOfSize:15] viewWidth:Scr_w-20];
    
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10);
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.headImageView.mas_bottom).offset(10);
        make.height.mas_equalTo(textH +40);
    }];
    
    if(self.dataModel.say.pics.count>0){
        [self.contenImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:CommitBaseImgURL,self.dataModel.say.pics[0]]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.contenImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView).inset(10);
                    make.top.equalTo(self.contentLabel.mas_bottom).offset(15);
                    CGFloat wid = image.size.width;
                    CGFloat hei = image.size.height;
                    if(image.size.height/7.0 > 130){
                        hei  = 120 * 7;
                        wid  = (image.size.width/image.size.height) * 120 * 7;
                        make.size.mas_equalTo(CGSizeMake(wid/ 7.0, hei/7.0));
                    }else if(image.size.height/7.0 > 50 && image.size.height/7.0<100){
                        make.size.mas_equalTo(CGSizeMake(wid/5.0, hei/5.0));
                    }else if(image.size.height/7.0 > 100 && image.size.height/7.0<130){
                        make.size.mas_equalTo(CGSizeMake(wid/6.0, hei/6.0));
                    }
                    else{
                        make.size.mas_equalTo(CGSizeMake(wid/6.0, hei/6.0));
                    }
                    
                }];
            });
        }];
    }else{
        [self.contenImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.1);
            make.left.equalTo(self.contenImgView).inset(10);
            make.top.equalTo(self.contentLabel.mas_bottom).offset(15);
        }];
    }
    
    
    if(self.dataModel.say.tags.length>0){
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.dataModel.say.content];
        NSRange range1 = [[str string] rangeOfString:[NSString stringWithFormat:@"#%@#",self.dataModel.say.tags]];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range1];
        self.contentLabel.attributedText = str;
    }else{
        self.contentLabel.text = self.dataModel.say.content;
    }
   
    self.userNameLabel.text = self.dataModel.say.senderNickName;
    self.timeLabel.text = self.dataModel.say.timeForShow;
    self.reviewLabel.text = self.dataModel.say.countOfComment;
    self.spotLabel.text = self.dataModel.say.countOfAgree;
    self.usrNameLabel.text = [NSString stringWithFormat:@"%@:",self.dataModel.recommendComment.nickName];
    self.reContentLabel.text = self.dataModel.recommendComment.content;
    if(self.dataModel.pre_isSopt){
           [self.spotImgView setImage:[UIImage imageNamed:@"have_sport"] forState:UIControlStateNormal];
       }else{
           [self.spotImgView setImage:[UIImage imageNamed:@"spotIconNew_new"] forState:UIControlStateNormal];
       }
    
    if(self.dataModel.pre_isAtten){
        [self.attentionBtn setTitleColor:[UIColor colorWithHexString:@"#d81e06"] forState:UIControlStateNormal];
        self.attentionBtn.layer.borderWidth = 0.8;
        self.attentionBtn.layer.borderColor = [UIColor colorWithHexString:@"#d81e06"].CGColor;
        self.attentionBtn.layer.cornerRadius = 3;
        
          }else{
              [self.attentionBtn setTitleColor:MainColor forState:UIControlStateNormal];
              self.attentionBtn.layer.borderWidth = 0.8;
              self.attentionBtn.layer.borderColor = MainColor.CGColor;
              self.attentionBtn.layer.cornerRadius = 3;
          }
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
        _userNameLabel.textColor = [UIColor colorWithHexString:@"#E2D0AA"];
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

- (YYLabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[YYLabel alloc]init];
       // _contentLabel.backgroundColor = [UIColor cyanColor];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.textColor = MainColor;
        _contentLabel.numberOfLines = 0;
        _contentLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
    }
    return _contentLabel;
}

- (UIImageView *)contenImgView{
    if(!_contenImgView){
        _contenImgView = [[UIImageView alloc]init];
        _contenImgView.contentMode = UIViewContentModeScaleToFill;
    }
    return _contenImgView;
}

- (UIButton *)attentionBtn{
    if(!_attentionBtn){
        
        _attentionBtn = [[UIButton alloc]init];
        [_attentionBtn setTitle:@"关注" forState:UIControlStateNormal];
        [_attentionBtn setTitleColor:MainColor forState:UIControlStateNormal];
        //_attentionBtn.backgroundColor = [UIColor redColor];
        _attentionBtn.layer.cornerRadius = 3;
        _attentionBtn.layer.borderWidth = 0.8;
        _attentionBtn.layer.borderColor = MainColor.CGColor
        ;        [_attentionBtn addTarget:self
                          action:@selector(attenAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _attentionBtn;
}

- (void)attenAction:(UIButton *)btn{
    [[LoginManager shareInsetance] checkLogin:^{
        self.hub = [MBProgressHUD showMessage:@"请稍等"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.hub hideAnimated:YES];
            if(self.dataModel.pre_isAtten){
                [self.attentionBtn setTitleColor:MainColor forState:UIControlStateNormal];
                self.attentionBtn.layer.borderWidth = 0.8;
                self.attentionBtn.layer.borderColor = MainColor.CGColor;
                self.attentionBtn.layer.cornerRadius = 3;
            }else{
                [self.attentionBtn setTitleColor:[UIColor colorWithHexString:@"#d81e06"] forState:UIControlStateNormal];
                self.attentionBtn.layer.borderWidth = 0.8;
                self.attentionBtn.layer.borderColor = [UIColor colorWithHexString:@"#d81e06"].CGColor;
                self.attentionBtn.layer.cornerRadius = 3;
            }
            self.dataModel.pre_isAtten = !self.dataModel.pre_isAtten;
         });
    }];
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
        _shareTextLabel.textColor = MainColor;
        _shareTextLabel.font = [UIFont systemFontOfSize:15];
        //_shareTextLabel.backgroundColor = [UIColor redColor];
        [_shareTextLabel sizeToFit];
    }
    return _shareTextLabel;
}

- (void)shareAction:(UIButton *)share{
    [[LoginManager shareInsetance] checkLogin:^{
        if(self.shablock){
            self.shablock(self.dataModel);
        }
    }];
}

- (UIButton *)reviewIcon{
    if(!_reviewIcon){
        _reviewIcon = [[UIButton alloc]init];
        [_reviewIcon setImage:[UIImage imageNamed:@"review_newNewIcon"] forState:UIControlStateNormal];
        [_reviewIcon addTarget:self action:@selector(reviewACtion:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reviewIcon;
}

- (UILabel *)reviewLabel{
    if(!_reviewLabel){
        
        _reviewLabel = [[UILabel alloc]init];
        //_reviewLabel.text = @"评论";
        _reviewLabel.font = [UIFont systemFontOfSize:15];
        _reviewLabel.textColor = MainColor;
    }
    return _reviewLabel;
}

- (void)reviewACtion:(UIButton *)btn{
    [[LoginManager shareInsetance] checkLogin:^{
        if(self.reBlock){
              self.reBlock(self.dataModel);
          }
    }];
}

- (UIButton *)spotImgView{
    if(!_spotImgView){
        
        _spotImgView = [[UIButton alloc]init];
        [_spotImgView setImage:[UIImage imageNamed:@"spotIconNew_new"] forState:UIControlStateNormal];
        [_spotImgView addTarget:self action:@selector(spotAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _spotImgView;
}

- (UILabel *)spotLabel{
    if(!_spotLabel){
        _spotLabel = [[UILabel alloc]init];
        _spotLabel.text = @"点赞";
        _spotLabel.font = [UIFont systemFontOfSize:15];
        _spotLabel.textColor = MainColor;
    }
    return _spotLabel;
}

- (void)spotAction:(UIButton *)spot{
    //点赞
    [[LoginManager shareInsetance] checkLogin:^{
        NSInteger  spotin  = [self.dataModel.say.countOfAgree  intValue];
           if(self.dataModel.pre_isSopt){
               [self.spotImgView setImage:[UIImage imageNamed:@"spotIconNew_new"] forState:UIControlStateNormal];
               spotin--;
           }else{
               [self.spotImgView setImage:[UIImage imageNamed:@"have_sport"] forState:UIControlStateNormal];
               spotin++;
           }
           self.dataModel.pre_isSopt = !self.dataModel.pre_isSopt;
        self.dataModel.say.countOfAgree = [NSString stringWithFormat:@"%ld",spotin];
        self.spotLabel.text = self.dataModel.say.countOfAgree;
    }];
    
}

- (UIView *)lineView{
    if(!_lineView){
        
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = MainColor;
    }
    return _lineView;
}

- (UILabel *)usrNameLabel{
    if(!_usrNameLabel){
        _usrNameLabel = [[UILabel alloc]init];
        _usrNameLabel.font = [UIFont boldSystemFontOfSize:13];
        _usrNameLabel.textColor = MainColor;
        _usrNameLabel.backgroundColor = [UIColor redColor];
        _usrNameLabel.textAlignment = NSTextAlignmentLeft;
        [_usrNameLabel sizeToFit];
    }
    return _usrNameLabel;
}

- (UIView *)blanView{
    if(!_blanView){
        _blanView = [[UIView alloc]init];
        _blanView.backgroundColor = [UIColor colorWithHexString:@"#F3F7FD"];
    }
       return _blanView;
}

- (UILabel *)reContentLabel{
    if(!_reContentLabel){
        
        _reContentLabel = [[UILabel alloc]init];
        _reContentLabel.textColor = [UIColor colorWithHexString:@"#7D7D7E"];
        _reContentLabel.backgroundColor = [UIColor redColor];
        _reContentLabel.textAlignment = NSTextAlignmentLeft;
        _reContentLabel.font  =[UIFont systemFontOfSize:13];
    }
    return _reContentLabel;
}

- (UIView *)bView{
    if(!_bView){
        
        _bView = [[UIView alloc]init];
        _bView.backgroundColor = [UIColor greenColor];
    }
    return _bView;
}

@end
