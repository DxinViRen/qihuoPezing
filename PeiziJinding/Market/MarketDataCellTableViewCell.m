//
//  MarketDataCellTableViewCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketDataCellTableViewCell.h"

@interface MarketDataCellTableViewCell ()

@end

@implementation MarketDataCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self dxLayoutSubView];
    }
    return self;
}

- (void)dxLayoutSubView{
    [self.contentView addSubview:self.mTitleLabel];
    [self.contentView addSubview:self.neTitleLanbel];
    [self.contentView addSubview:self.lastPrice];
    [self.contentView addSubview:self.turnoverLabel];
//    [self.contentView addSubview:self.rangeLabel];
    
    [self.mTitleLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.width.mas_equalTo(Scr_w/3.0);
        make.top.equalTo(self.contentView).inset(10);
        
    }];
    
    [self.neTitleLanbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mTitleLabel);
        make.width.equalTo(self.mTitleLabel);
        make.top.equalTo(self.mTitleLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
    }];
    
    NSArray *arr = @[self.mTitleLabel,self.lastPrice,self.turnoverLabel];
    [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [self.lastPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mTitleLabel);
       
    }];
    
    [self.turnoverLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.lastPrice);
    }];
    
//    [self.rangeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.lastPrice);
//        make.right.equalTo(self.contentView).inset(10);
//    }];
}

- (void)setModel:(MarketDetailModel *)model{
    _model = model;
    self.mTitleLabel.text = _model.cat_name;
    self.neTitleLanbel.text = _model.product_name;
   // self.numDaraArr = _model.pre_numArr;
   // self.lastPrice.text =
    /**
     
     @property(nonatomic,strong)UILabel *mTitleLabel;    //名称
     @property(nonatomic,strong)UILabel *neTitleLanbel;  //年份
     @property(nonatomic,strong)UILabel *lastPrice;      //最新价格
     @property(nonatomic,strong)UILabel *turnoverLabel;  //成交量
     @property(nonatomic,strong)UILabel *rangeLabel;     //幅度
     */
    _model.pre_numArr  = self.numDaraArr;
    if([self.numDaraArr[2] floatValue] >0){
        self.mTitleLabel.textColor = [UIColor colorWithHexString:@"#F92E3C"];
        self.neTitleLanbel.textColor = [UIColor colorWithHexString:@"#F92E3C"];
        self.lastPrice.textColor = [UIColor colorWithHexString:@"#F92E3C"];
        self.turnoverLabel.textColor = [UIColor colorWithHexString:@"#F92E3C"];
        self.rangeLabel.textColor = [UIColor colorWithHexString:@"#F92E3C"];
              }
    else{
                  self.mTitleLabel.textColor = [UIColor colorWithHexString:@"#18C07E"];
                  self.neTitleLanbel.textColor = [UIColor colorWithHexString:@"#18C07E"];
                  self.lastPrice.textColor = [UIColor colorWithHexString:@"#18C07E"];
                  self.turnoverLabel.textColor = [UIColor colorWithHexString:@"#18C07E"];
                  self.rangeLabel.textColor = [UIColor colorWithHexString:@"#18C07E"];
              }
}


- (UILabel *)mTitleLabel{
    if(!_mTitleLabel){
        
        _mTitleLabel = [[UILabel alloc]init];
        _mTitleLabel.font = [UIFont systemFontOfSize:15];
        _mTitleLabel.textColor = MainColor;
        _mTitleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _mTitleLabel;
}

- (UILabel *)lastPrice{
    if(!_lastPrice){
        _lastPrice = [[UILabel alloc]init];
        _lastPrice.font = [UIFont systemFontOfSize:15];
        _lastPrice.textColor = MainColor;
        _lastPrice.textAlignment = NSTextAlignmentCenter;
    }
    return _lastPrice;
}

- (UILabel *)turnoverLabel{
    if(!_turnoverLabel){
        _turnoverLabel = [[UILabel alloc]init];
        _turnoverLabel.font = [UIFont systemFontOfSize:15];
        _turnoverLabel.textColor = MainColor;
        //_turnoverLabel.backgroundColor = [UIColor redColor];
        _turnoverLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _turnoverLabel;
}

- (UILabel *)rangeLabel{
    if(!_rangeLabel){
        _rangeLabel = [[UILabel alloc]init];
        _rangeLabel.font = [UIFont systemFontOfSize:15];
        _rangeLabel.textColor = MainColor;
        _rangeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _rangeLabel;
}

- (UILabel *)neTitleLanbel{
    if(!_neTitleLanbel){
        
        _neTitleLanbel = [[UILabel alloc]init];
        _neTitleLanbel.font = [UIFont systemFontOfSize:13];
        _neTitleLanbel.textColor = MainColor;
        _neTitleLanbel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _neTitleLanbel;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
