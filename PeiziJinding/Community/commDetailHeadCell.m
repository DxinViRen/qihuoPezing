//
//  commDetailHeadCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "commDetailHeadCell.h"
#import "CommSayModel.h"

@interface commDetailHeadCell  ()
@property(nonatomic,strong)UILabel *headLabel;
@property(nonatomic,strong)UILabel *dxtitleLabel;
@end

@implementation commDetailHeadCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSuveiw];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setModel:(id<MainCellModelProtocol>)model{
    CommSayModel *sam= (CommSayModel *)model;
    self.dxtitleLabel.text = sam.countOfComment;
}

- (void)dx_layoutSuveiw{
    [self.contentView addSubview:self.headLabel];
    [self.contentView addSubview:self.dxtitleLabel];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(10).priority(1000);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.dxtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(self.headLabel.mas_right).inset(10);
        make.centerY.equalTo(self.headLabel);
        
    }];
}

- (UILabel *)headLabel{
    if(!_headLabel){
        _headLabel = [[UILabel alloc]init];
        _headLabel.font = [UIFont boldSystemFontOfSize:17];
        _headLabel.textColor = [UIColor colorWithHexString:@"#"];
        _headLabel.textAlignment = NSTextAlignmentLeft;
        _headLabel.text = @"评论";
    }
    return _headLabel;
}

- (UILabel *)dxtitleLabel{
    if(!_dxtitleLabel){
        
        _dxtitleLabel = [[UILabel alloc]init];
        _dxtitleLabel.textColor = MainColor;
        _dxtitleLabel.text = @"看看";
        //_dxtitleLabel.backgroundColor = [UIColor redColor];
        _dxtitleLabel.font = [UIFont systemFontOfSize:15];
        _dxtitleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _dxtitleLabel;
}
@end
