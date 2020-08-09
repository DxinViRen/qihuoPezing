//
//  NewsCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/6.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "NewsCell.h"
#import "NewsNewModel.h"
#import <YYLabel.h>
#import <YYText.h>
#import "NewsDetaiItemModel.h"
@interface NewsCell ()
@property(nonatomic,strong)UIView *lineView;
@property(nonatomic,strong)UILabel *dxtitlelabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIImageView *mainImgView;
@property(nonatomic,strong)UILabel *sourceLabel;
@end

@implementation NewsCell
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
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.dxtitlelabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.mainImgView];
    [self.contentView addSubview:self.sourceLabel];
    
     
    [self.dxtitlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10);
        make.top.equalTo(self.contentView).inset(15);
        make.right.equalTo(self.contentView).inset(Scr_w * (160/375.0));
        make.bottom.equalTo(self.contentView).inset(40);
    }];
    
    [self.sourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dxtitlelabel);
        make.centerY.equalTo(self.timeLabel);
    }];
    
    [self.mainImgView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.equalTo(self.contentView).inset(10);
           make.right.equalTo(self.contentView).inset(10);
           make.width.mas_equalTo(Scr_w *(120/375.0));
           make.height.equalTo(self.mainImgView.mas_width).multipliedBy(7/12.0);
       }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).inset(10);
        make.right.equalTo(self.mainImgView.mas_left).offset(-10);
    }];
    
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
        make.centerX.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(10);
    }];
}

- (void)setModel:(id<MainCellModelProtocol>)model{
     NewsDetaiItemModel*newModel =(NewsDetaiItemModel *) model;
    self.dxtitlelabel.text = newModel.title;
    if(newModel.url_w.length == 0){
        newModel.url_w = @"";
    }
    [self.mainImgView sd_setImageWithURL:[NSURL  URLWithString:newModel.image] placeholderImage:[UIImage imageNamed:@""]];
    self.timeLabel.text = [self timeStr:[newModel.showtime substringWithRange:NSMakeRange(0, 10)]];
    self.sourceLabel.text = newModel.Art_Media_Name;
}

- (UIView *)lineView{
    if(!_lineView){
        
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _lineView;
}

- (UILabel *)dxtitlelabel{
    if(!_dxtitlelabel){
        
        _dxtitlelabel = [[UILabel alloc]init];
        _dxtitlelabel.textColor = MainColor;
        _dxtitlelabel.textAlignment = NSTextAlignmentLeft;
        _dxtitlelabel.font = [UIFont systemFontOfSize:15];
       // _dxtitlelabel.preferredMaxLayoutWidth =Scr_w - 20 - Scr_w * (160/375.0);
        _dxtitlelabel.numberOfLines = 0;
        _dxtitlelabel.lineBreakMode = NSLineBreakByWordWrapping;
        //_dxtitlelabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
        //[_dxtitlelabel sizeToFit];
    }
    return _dxtitlelabel;
}

- (UILabel *)timeLabel{
    if(!_timeLabel){
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textColor = MainColor;
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.numberOfLines = 0;
        _timeLabel.lineBreakMode = NSLineBreakByWordWrapping;
        //_timeLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    }
    return _timeLabel;
}

- (UIImageView *)mainImgView{
    if(!_mainImgView){
        
        _mainImgView = [[UIImageView alloc]init];
        _mainImgView.layer.cornerRadius = 6;
        _mainImgView. clipsToBounds = YES;
        _mainImgView.backgroundColor = [UIColor redColor];
    }
    return _mainImgView;
}

- (UILabel *)sourceLabel{
    if(!_sourceLabel){
        
        _sourceLabel = [[UILabel alloc]init];
        _sourceLabel.font = [UIFont systemFontOfSize:13];
        _sourceLabel.textColor = MainColor;
        _sourceLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _sourceLabel;
}

- (NSString *)timeStr:(NSString *)str{
    NSString *m = [str substringWithRange:NSMakeRange(5, 2)];
    NSString *d = [str substringWithRange:NSMakeRange(8, 2)];
    NSString *msd = [NSString stringWithFormat:@"%d月%d日",[m intValue],[d intValue]];
    return msd;
}
@end
