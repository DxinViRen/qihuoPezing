//
//  ComDetailCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "ComDetailCell.h"
#import <YYText.h>
#import "AgreeRelationItemModel.h"
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
@property(nonatomic,strong)UIView *topLineView;
@property(nonatomic,strong)CommSayModel *dataModel;
@property(nonatomic,strong)UIView *botBgView;
@property(nonatomic,strong)UIImageView *lastAgreeView;
@property(nonatomic,strong)UILabel *agreeCLabel;
@property(nonatomic,strong)UIButton *attBtn;
@property(nonatomic,strong)MBProgressHUD *hud;
@property(nonatomic,strong)MBProgressHUD *mhud;

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
        self.contentView.backgroundColor = [UIColor whiteColor];
        //self.contentView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)dx_layoutSubview{
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.nameLabe];
    //[self.contentView addSubview:self.attensionBtn];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.contentImageView];
    [self.contentView addSubview:self.riskLabel];
    [self.contentView addSubview:self.lineView];
    //[self.contentView addSubview:self.spotIcon];
    [self.contentView addSubview:self.timeLable];
    [self.contentView addSubview:self.topLineView];
    [self.contentView addSubview:self.botBgView];
    [self.botBgView addSubview:self.spotIcon];
    [self.contentView addSubview:self.attBtn];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(10);
        make.top.equalTo(self.contentView).inset(2);
        make.height.mas_equalTo(1);
    }];
    
    [self.attBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImageView);
        make.right.equalTo(self.contentView).inset(20);
        make.size.mas_equalTo(CGSizeMake(85, 40));
    }];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10);
        make.top.equalTo(self.contentView).inset(15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    [self.nameLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageView.mas_right).offset(10);
        make.top.equalTo(self.headImageView);
    }];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabe);
        make.top.equalTo(self.nameLabe.mas_bottom).offset(8);
    }];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentLabel).offset(8);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(CGSizeMake(CGFLOAT_MIN, CGFLOAT_MIN));
    }];
    
//    [self.attensionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.headImageView);
//        make.right.equalTo(self.contentView).inset(10);
//        make.size.mas_equalTo(CGSizeMake(71, 24));
//    }];

    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(10);
        make.bottom.equalTo(self.contentView).inset(45);
        make.height.mas_equalTo(1);
    }];
    
    [self.riskLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lineView);
        make.bottom.equalTo(self.lineView.mas_top);
        make.right.equalTo(self.lineView);
        make.height.mas_equalTo(30);
    }];
    
    [self.botBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.right.equalTo(self.contentView);
        make.top.equalTo(self.lineView);
    }];
    
//    [self.spotIcon mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.botBgView).inset(10);
//        make.centerY.equalTo(self.botBgView);
//        make.size.mas_equalTo(CGSizeMake(20, 20));
//    }];
//
     
}

- (void)setModel:(id<MainCellModelProtocol>)model{
    CommSayModel *sayModel = (CommSayModel *)model;
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:CommitBaseImgURL,sayModel.senderPhoto]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    self.nameLabe.text = sayModel.senderNickName;
    self.timeLable.text = sayModel.timeForShow;

    
    CGFloat contentLabeH = sayModel.pre_textH;
     [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
           make.left.equalTo(self.contentView).inset(10);
           make.centerX.equalTo(self.contentView);
           make.top.equalTo(self.headImageView.mas_bottom).offset(10);
           make.height.mas_equalTo(contentLabeH);
       }];
    self.contentImageView.image = sayModel.pre_image;
    [self.contentImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                   make.left.equalTo(self.contentLabel).offset(8);
                   make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
        make.size.mas_equalTo(sayModel.pre_imgsize);
               }];
   
   
    if(sayModel.tags.length>0){
           NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:sayModel.content];
        NSRange range1 = NSMakeRange(0, sayModel.tags.length+6);
        NSRange range2 = NSMakeRange(sayModel.tags.length, sayModel.content.length - sayModel.tags.length);
           [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range1];
           [str addAttribute:NSForegroundColorAttributeName value:MainColor range:range2];
           self.contentLabel.attributedText = str;
       }
    self.contentLabel.text = sayModel.content;
    self.riskLabel.text = sayModel.pre_disclaimer;
    
    NSInteger count = sayModel.pre_alArr.count;
    if(count>5)count = 5;
    for (int i = 0; i < count ; i ++) {
        UIImageView *imageview = [[UIImageView alloc]init];
        imageview.frame = CGRectMake(Scr_w-120-i*(20+8), 12, 20, 20);
        imageview.layer.cornerRadius = 10;
        imageview.clipsToBounds = YES;
        AgreeRelationItemModel *amodel = sayModel.pre_alArr[i];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:CommitBaseImgURL,amodel.userHeadPhoto]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        }];
        if(i == 0){
            self.lastAgreeView = imageview;
        }
        
        [self.botBgView addSubview:imageview];
    }
    [self.botBgView addSubview:self.agreeCLabel];
    [self.agreeCLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.lastAgreeView.mas_right).offset(10);
        make.centerY.equalTo(self.botBgView);
    }];
    
    self.agreeCLabel.text = [NSString stringWithFormat:@"...共%ld人点赞", sayModel.pre_alArr.count];
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
        _nameLabe.textColor = [UIColor colorWithHexString:@"#F92E3C"];
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
       // _contentLabel.backgroundColor = [UIColor orangeColor];
        _contentLabel.font = [UIFont systemFontOfSize:15];
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
        //_contentImageView.backgroundColor = [UIColor cyanColor];
        _contentImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _contentImageView;
}

- (UILabel *)riskLabel{
    if(!_riskLabel){
        _riskLabel = [[UILabel  alloc]init];
        _riskLabel.font = [UIFont systemFontOfSize:11];
        _riskLabel.textColor = [UIColor colorWithHexString:@"#F92E3C"];
        _riskLabel.textAlignment = NSTextAlignmentRight;
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
        _spotIcon.image = [UIImage imageNamed:@"spotlistIcon"];
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
        _attensionBtn.layer.borderColor = MainColor.CGColor;
//        ;      //  [_attensionBtn addTarget:self
//                          action:@selector(attenAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _attensionBtn;
}

- (UIView *)topLineView{
    if(!_topLineView){
        
        _topLineView = [[UIView alloc]init];
        _topLineView.backgroundColor = MainColor;
    }
    return _topLineView;
}



//- (void)attenAction:(UIButton *)bt{
//    [[LoginManager shareInsetance] checkLogin:^{
//        self.hub = [MBProgressHUD showMessage:@"请稍等"];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.hub hideAnimated:YES];
//            if(self.dataModel.pre_isAtten){
//                [self.attensionBtn setTitleColor:MainColor forState:UIControlStateNormal];
//                self.attensionBtn.layer.borderWidth = 0.8;
//                self.attensionBtn.layer.borderColor = MainColor.CGColor;
//                self.attensionBtn.layer.cornerRadius = 3;
//            }else{
//                [self.attensionBtn setTitleColor:[UIColor colorWithHexString:@"#d81e06"] forState:UIControlStateNormal];
//                self.attensionBtn.layer.borderWidth = 0.8;
//                self.attensionBtn.layer.borderColor = [UIColor colorWithHexString:@"#d81e06"].CGColor;
//                self.attensionBtn.layer.cornerRadius = 3;
//            }
//            self.dataModel.pre_isAtten = !self.dataModel.pre_isAtten;
//         });
//    }];
//}


- (UIView *)botBgView{
    if(!_botBgView){
        
        _botBgView = [[UIView alloc]init];
    }
    return _botBgView;
}

- (UILabel *)agreeCLabel{
    if(!_agreeCLabel){
        
        _agreeCLabel = [[UILabel alloc]init];
        _agreeCLabel.textColor = MainColor;
        _agreeCLabel.font = [UIFont systemFontOfSize:13];
        _agreeCLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _agreeCLabel;
}

- (UIButton *)attBtn {
    if(!_attBtn){
        _attBtn = [[UIButton alloc]init];
        [_attBtn setImage:[UIImage imageNamed:@"attenIcon"] forState:UIControlStateNormal];
        [_attBtn addTarget:self action:@selector(attensionActiuon:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _attBtn;
}

- (void)attensionActiuon:(UIButton *)btn{
    self.mhud =  [MBProgressHUD showMessage:@""];
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         self.hud = [MBProgressHUD showMessage:@"关注成功"];
         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             [self.hud hideAnimated:YES];
             [self.mhud hideAnimated:YES];
                });
    });
}
@end

