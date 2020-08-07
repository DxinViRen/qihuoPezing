//
//  CalNewsCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CalNewsCell.h"
#import "CalNewsModel.h"
@interface CalNewsCell ()
@property(nonatomic,strong)UIImageView *starImageView1;
@property(nonatomic,strong)UIImageView *starImageView2;
@property(nonatomic,strong)UIImageView *starImageView3;
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UIView *botLineView;
@property(nonatomic,strong)UIView *lineView2;
@end

@implementation CalNewsCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSubview];
        //self.contentView.backgroundColor = [UIColor redColor];
    }
    return self;
}

/**
 @property (nonatomic,strong)UILabel * timeLabel;       //时间
 @property (nonatomic,strong)UILabel * statusLAbel;     // 状态
 @property (nonatomic,strong)UILabel * maintitleLabel;  //标题
 @property (nonatomic,strong)UILabel * consensusLabel;  //预期
 @property (nonatomic,strong)UILabel * previousLabel;  //前值
 @property (nonatomic,strong)UILabel * actualLabel;    //今值
 */

-  (void)dx_layoutSubview{
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.statusLAbel];
    [self.contentView addSubview:self.maintitleLabel];
    [self.contentView addSubview:self.consensusLabel];
    [self.contentView addSubview:self.previousLabel];
    [self.contentView addSubview:self.actualLabel];
    [self.contentView addSubview:self.starImageView1];
    [self.contentView addSubview:self.starImageView2];
    [self.contentView addSubview:self.starImageView3];
    [self.contentView addSubview:self.botLineView];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.lineView2];
    [self.botLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(10);
        make.height.mas_equalTo(0.6);
    }];
    
    [self.statusLAbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).inset(10);
        make.left.equalTo(self.contentView).inset(90);
        make.width.mas_equalTo(Scr_w *(100/375.0));
        make.height.equalTo(self.statusLAbel.mas_width).multipliedBy(9/40.0);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).inset(10);
        make.right.equalTo(self.contentView).inset(Scr_w - Scr_w *(66.0/375));
    }];
    
    [self.maintitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusLAbel.mas_bottom).offset(7);
        make.left.equalTo(self.statusLAbel);
        make.height.mas_equalTo(40);
        make.right.equalTo(self.contentView).inset(20);
    }];
    
    [self.previousLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.maintitleLabel);
        make.bottom.equalTo(self.contentView).inset(7);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(18);
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.previousLabel.mas_right).offset(-10);
        make.centerY.equalTo(self.previousLabel);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(0.8);
    }];
    
    [self.consensusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.previousLabel);
        make.left.equalTo(self.lineView.mas_right).offset(10);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(80);
    }];
    
    [self.lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lineView);
        make.left.equalTo(self.consensusLabel.mas_right).offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(0.5);
    }];
    
    [self.actualLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.previousLabel);
        make.left.equalTo(self.lineView2.mas_right).offset(10);
        make.height.mas_equalTo(20);
        make.right.equalTo(self.contentView).inset(5);
    }];
    
    [self.starImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.statusLAbel);
        make.right.equalTo(self.contentView).inset(60);
        make.size.mas_equalTo(CGSizeMake(9, 9));
    }];
    
    [self.starImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.statusLAbel);
        make.left.equalTo(self.starImageView1.mas_right).offset(8);
        make.size.mas_equalTo(CGSizeMake(9, 9));
    }];
    
    [self.starImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.statusLAbel);
        make.left.equalTo(self.starImageView2.mas_right).offset(8);
        make.size.mas_equalTo(CGSizeMake(9, 9));
    }];
}

-(void)setModel:(id<MainCellModelProtocol>)model{
    CalNewsModel *caModel =(CalNewsModel *)model;
    self.timeLabel.text = caModel.time_show;
    //self.statusLAbel.text = caModel.status_name;
    if([caModel.status_name isEqualToString:@"利多"]){
        _statusLAbel.textColor =  LIHAOCOLOR;
        _statusLAbel.text = @"利多 金银 原油";
        _statusLAbel.layer.borderColor = LIHAOCOLOR.CGColor;
        _statusLAbel.layer.borderWidth = 0.7;
        _statusLAbel.layer.cornerRadius = 5;
        _statusLAbel.textAlignment = NSTextAlignmentCenter;
    }else{
        _statusLAbel.textColor =  LIKONGCOLOR;
        _statusLAbel.text = @"利空 金银 原油";
        _statusLAbel.layer.borderColor = LIKONGCOLOR.CGColor;
        _statusLAbel.layer.borderWidth = 0.7;
        _statusLAbel.layer.cornerRadius = 5;
        _statusLAbel.textAlignment = NSTextAlignmentCenter;
    }
    self.maintitleLabel.text = caModel.title;
    self.previousLabel.text = [NSString stringWithFormat:@"前值 %@%@",caModel.previous,caModel.unit];
    self.consensusLabel.text = [NSString stringWithFormat:@"预期 %@",caModel.consensus];
    self.actualLabel.text = [NSString stringWithFormat:@"今值 %@",caModel.actual];
    
    NSInteger starNum = [caModel.star intValue];
    switch (starNum) {
        case 1:
        {
            self.starImageView1.image = [UIImage imageNamed:@"mainStarH"];
            self.starImageView2.image = [UIImage imageNamed:@"mainstar"];
            self.starImageView3.image = [UIImage imageNamed:@"mainstar"];
        }
            break;
        case 2:
        {
            self.starImageView1.image = [UIImage imageNamed:@"mainStarH"];
            self.starImageView2.image = [UIImage imageNamed:@"mainStarH"];
            self.starImageView3.image = [UIImage imageNamed:@"mainstar"];
        }
            break;
            
        case 3:
        {
            self.starImageView1.image = [UIImage imageNamed:@"mainStarH"];
            self.starImageView2.image = [UIImage imageNamed:@"mainStarH"];
            self.starImageView3.image = [UIImage imageNamed:@"mainStarH"];
        }
            break;
            
        default:
            break;
    }
    
}

- (UILabel *)timeLabel{
    if(!_timeLabel){
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = MainColor;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}
- (UILabel *)statusLAbel{
    if(!_statusLAbel){
        _statusLAbel = [[UILabel alloc]init];
        _statusLAbel.font = [UIFont systemFontOfSize:15];
        _statusLAbel.textColor =  LIKONGCOLOR;
        _statusLAbel.text = @"利空 金银 原油";
        _statusLAbel.layer.borderColor = LIKONGCOLOR.CGColor;
        _statusLAbel.layer.borderWidth = 0.7;
        _statusLAbel.layer.cornerRadius = 5;
        _statusLAbel.textAlignment = NSTextAlignmentCenter;
    }
    return _statusLAbel;
}

- (UILabel *)maintitleLabel{
    if(!_maintitleLabel){
        _maintitleLabel = [[UILabel alloc]init];
        _maintitleLabel.textColor = [UIColor colorWithHexString:@"#ED9D33"];
        _maintitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _maintitleLabel.numberOfLines = 0;
        _maintitleLabel.textAlignment = NSTextAlignmentLeft;
        _maintitleLabel.font =  [UIFont systemFontOfSize:15];
    }
    return _maintitleLabel;
}

- (UILabel *)previousLabel{
    if(!_previousLabel){
        _previousLabel = [[UILabel alloc]init];
        _previousLabel.font = [UIFont systemFontOfSize:12];
        _previousLabel.textColor  = MainColor;
        _previousLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _previousLabel;
}

- (UILabel *)actualLabel{
    if(!_actualLabel){
        _actualLabel = [[UILabel alloc]init];
        _actualLabel.font = [UIFont systemFontOfSize:12];
        _actualLabel.textAlignment = NSTextAlignmentLeft;
        _actualLabel.textColor  = MainColor;
        _actualLabel.textAlignment = NSTextAlignmentCenter;
       
    }
    return _actualLabel;
}

- (UIView *)lineView{
    if(!_lineView){
        
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#C09843"];
    }
    return _lineView;
}

- (UIView *)botLineView{
    if(!_botLineView){
        _botLineView = [[UIView alloc]init];
        _botLineView.backgroundColor = [UIColor colorWithHexString:@"#C09843"];
    }
    return _botLineView;
}
- (UILabel *)consensusLabel{
    if(!_consensusLabel){
        
        _consensusLabel = [[UILabel alloc]init];
        _consensusLabel.textColor  = MainColor;
        _consensusLabel.font = [UIFont systemFontOfSize:12];
        _consensusLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _consensusLabel;;
}

- (UIView *)lineView2{
    if(!_lineView2){
        _lineView2 = [[UIView alloc]init];
        _lineView2.backgroundColor = [UIColor colorWithHexString:@"#C09843"];
    }
    return _lineView2;;
}

- (UIImageView *)starImageView1{
    if(!_starImageView1){
        _starImageView1 = [[UIImageView alloc]init];
        _starImageView1.image = [UIImage  imageNamed:@"mainstar"];
    }
    return _starImageView1;;
}

- (UIImageView *)starImageView2{
    if(!_starImageView2){
        _starImageView2 = [[UIImageView alloc]init];
        _starImageView2.image = [UIImage  imageNamed:@"mainstar"];
    }
    return _starImageView2;;
}

- (UIImageView *)starImageView3{
    if(!_starImageView3){
        _starImageView3 = [[UIImageView alloc]init];
        _starImageView3.image = [UIImage  imageNamed:@"mainstar"];
    }
    return _starImageView3;;
}
@end
