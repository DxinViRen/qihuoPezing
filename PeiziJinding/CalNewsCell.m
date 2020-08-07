//
//  CalNewsCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CalNewsCell.h"

@interface CalNewsCell ()
@property(nonatomic,strong)UIImageView *starImageView1;
@property(nonatomic,strong)UIImageView *starImageView2;
@property(nonatomic,strong)UIImageView *starImageView3;
@end

@implementation CalNewsCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSubview];
    }
    return self;
}

/**
 @property (nonatomic,strong)UILabel * timeLabel;       //时间
 @property (nonatomic,strong)UILabel * statusLAbel;     // 状态
 @property (nonatomic,strong)UILabel * maintitleLabel;  //标题
 @property (nonatomic,strong)UILabel * consensusLabel;  //预期
 @property (nonatomic,strong)UILabel * previousLabel;  //前值
 @property (nonatomic,strong)UILabel * actualLabel;    //前值
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
}

- (UILabel *)timeLabel{
    if(!_timeLabel){
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = [UIColor  colorWithHexString:@"#C09843"];
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}
- (UILabel *)statusLAbel{
    if(!_statusLAbel){
        
        _statusLAbel = [[UILabel alloc]init];
        _statusLAbel.font = [UIFont systemFontOfSize:15];
        _statusLAbel.textColor =  
    }
    return _statusLAbel;
}
@end
