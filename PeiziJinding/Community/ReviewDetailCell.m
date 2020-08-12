//
//  ReviewDetailCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "ReviewDetailCell.h"
#import "CommCommentJsonModel.h"
#import "CommDetailItemModel.h"
#import <YYText.h>
@interface ReviewDetailCell ()
@property(nonatomic,strong)UIImageView *headImageview;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)YYLabel *contentLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *sonReviewLabel;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *sonview;

@end


@implementation ReviewDetailCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSubview];
        self.contentView.backgroundColor  = [UIColor whiteColor];
    }
    return self;
}


- (void)setModel:(id<MainCellModelProtocol>)model{
    CommDetailItemModel *itemModel = (CommDetailItemModel *)model;
    ;
    [self.headImageview sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:CommitBaseImgURL,itemModel.photo]] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
    
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(20);
        make.right.equalTo(self.contentView).inset(20);
        make.height.mas_equalTo(itemModel.pre_preContentH);
        make.width.mas_equalTo(Scr_w);
    }];
    
    CGFloat sh = 0;
    for (NSNumber *num in itemModel.pre_SonH) {
        CGFloat sonh = [num floatValue];
        sh += sonh;
    }
//    [self.sonview mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentLabel);
//        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
//        make.width.equalTo(self.contentLabel);
//        make.height.mas_equalTo(sh+30);
//    }];
    self.nameLabel.text = itemModel.nickName;
    self.contentLabel.text =  itemModel.content;
    NSString *str = [NSString stringWithFormat:@"%@",itemModel.commentTime];
    //NSLog(@"%@",);
    self.timeLabel.text =[self timewithIntervasting:str];
    CGFloat hei = 0;
    for (int i = 0; i < itemModel.pre_SonH.count; i ++) {
        UILabel *sonlabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 2+hei+10,Scr_w - 60, [itemModel.pre_SonH[i] floatValue]+10)];
        CommDetailItemModel *sonmodel = itemModel.sonList[i];
        sonlabel.numberOfLines = 0;
        sonlabel.lineBreakMode = NSLineBreakByWordWrapping;
        sonlabel.text = [NSString stringWithFormat:@"%@:%@",sonmodel.nickName, sonmodel.content];
        [self.sonview addSubview:sonlabel];
        hei = hei + [itemModel.pre_SonH[i] floatValue];
    }
}

- (void)dx_layoutSubview{
    [self.contentView addSubview:self.headImageview];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.sonReviewLabel];
    [self.contentView addSubview:self.lineView];
  //  [self.contentView addSubview:self.sonview];
    [self.headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(20);
        make.top.equalTo(self.contentView).inset(10);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageview.mas_right).offset(16);
        make.top.equalTo(self.headImageview).offset(2).priority(1000);
        make.height.mas_equalTo(20);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10);
        make.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.height.mas_equalTo(0.8);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10).priority(900);
       }];
    
//    [self.sonview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentLabel);
//        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
//        make.width.equalTo(self.contentLabel);
//        make.height.mas_equalTo(CGFLOAT_MIN);
//    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.bottom.equalTo(self.contentView).inset(15);
    }];
}

- (UIImageView *)headImageview{
    if(!_headImageview){
        
        _headImageview = [[UIImageView alloc]init];
        _headImageview.layer.cornerRadius = 12.5;
        _headImageview.clipsToBounds = YES;
    }
    return _headImageview;
}

- (UILabel *)nameLabel{
    if(!_nameLabel){
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font  =[UIFont systemFontOfSize:15];
        _nameLabel.textColor = [UIColor colorWithHexString:@"#F92E3C"];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UIView *)lineView{
    if(!_lineView){
        
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#E2D0AA"];
    }
    return _lineView;
}
- (UIView *)sonview{
    if(!_sonview){
        
        _sonview  = [[UIView alloc]init];
        _sonview.backgroundColor =[[UIColor colorWithHexString:@"#E2D0AA"]colorWithAlphaComponent:0.4];
        _sonview.layer.cornerRadius = 5;
        _sonview.clipsToBounds = YES;
        
    }
    return _sonview;
}

- (UILabel *)timeLabel{
    if(!_timeLabel){
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.textColor = [UIColor colorWithHexString:@"#E2D0AA"];;
    }
    return _timeLabel;
}

- (YYLabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[YYLabel alloc]init];
        //_contentLabel.backgroundColor = [UIColor orangeColor];
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.textColor = MainColor;
        _contentLabel.numberOfLines = 0;
        _contentLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        
    }
    return _contentLabel;
}

-(NSString *)timewithIntervasting:(NSString*)string{
    
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[string doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];//更改自己想要的时间格式
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}

@end
