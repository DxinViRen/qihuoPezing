//
//  StudayCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/18.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "StudayCell.h"
#import "StudyModel.h"
@interface StudayCell ()
@property(nonatomic,strong)UILabel *dxTitleLabel;
@property(nonatomic,strong)UIImageView *leftImageView;
@property(nonatomic,strong)UILabel *golLabel;
@property(nonatomic,strong)UILabel *havRelLabel;
@property(nonatomic,strong)UIView *blankView;
@property(nonatomic,assign)BOOL isSet;
@property(nonatomic,strong)NSMutableArray *laArr;
@property(nonatomic,strong)UIButton *playBtn;
@end


@implementation StudayCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSubview];
        self.isSet = NO;
        self.laArr = [@[] mutableCopy];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)dx_layoutSubview{
    [self.contentView addSubview:self.dxTitleLabel];
    [self.contentView addSubview:self.leftImageView];
    [self.contentView addSubview:self.golLabel];
    [self.contentView addSubview:self.havRelLabel];
    [self.contentView addSubview:self.blankView];
    
    [self.dxTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).inset(15);
        make.right.equalTo(self.contentView).inset(10);
        make.top.equalTo(self.contentView).inset(15);
        make.bottom.mas_lessThanOrEqualTo(40);
    }];
    
    
    [self.blankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(15);
    }];
    
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).inset(10);
        make.top.equalTo(self.contentView).inset(10);
        make.bottom.equalTo(self.contentView).inset(10);
        make.width.mas_equalTo(self.leftImageView.mas_height);
    }];
    
    
}


- (void)setModel:(id<MainCellModelProtocol>)model{
    StudyModel *study = (StudyModel *)model;
    self.dxTitleLabel.text = study.title;
    [self.leftImageView sd_setImageWithURL:[NSURL URLWithString:study.img]];
  
    for (UILabel *la in self.laArr) {
        if(la){
            [la removeFromSuperview];
        }
    }
        //标签
        CGFloat line  = 15;
        CGFloat space = 6;
    for (int i = 0; i < study.tagArr.count ; i ++) {
        NSString *str = study.tagArr[i];
        CGFloat width = str.length * 15 + 3;
        UILabel *la = [[UILabel alloc]init];
        la.frame = CGRectMake(line, 75, width, 20);
        la.text = study.tagArr[i];
        la.clipsToBounds = YES;
        la.layer.cornerRadius = 3;
        la.font = [UIFont systemFontOfSize:12];
        la.backgroundColor = [UIColor colorWithHexString:@"#C49F50"];
        la.textColor = [UIColor whiteColor];
        la.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:la];
        line += (width + space);
        [self.laArr addObject:la];
    }
       
   
}

- (UILabel *)dxTitleLabel{
    if(!_dxTitleLabel){
        
        _dxTitleLabel = [[UILabel alloc]init];
        _dxTitleLabel.textColor = [UIColor colorWithHexString:@"#D4237A"];
        _dxTitleLabel.textAlignment = NSTextAlignmentLeft;
        _dxTitleLabel.font = [UIFont systemFontOfSize:15];
        _dxTitleLabel.numberOfLines = 0;
        _dxTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _dxTitleLabel;
}

- (UIImageView *)leftImageView{
    if(!_leftImageView){
        
        _leftImageView = [[UIImageView alloc]init];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leftImageView;
}

- (UILabel *)golLabel{
    if(!_golLabel){
        
        _golLabel = [[UILabel alloc]init];
        _golLabel.font = [UIFont systemFontOfSize:12];
        _golLabel.textColor = MainColor;
        _golLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _golLabel;
}

- (UIView *)blankView{
    if(!_blankView){
        _blankView = [[UIView alloc]init];
        _blankView.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    }
    return _blankView;
}

- (UIButton *)playBtn{
    if(!_playBtn){
        
        _playBtn = [[UIButton alloc]init];
        [_playBtn setImage:[UIImage imageNamed:@"platbbtn"] forState:UIControlStateNormal];
        [_playBtn addTarget:self action:@selector(playActiponCell:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _playBtn;
}


- (void)playActiponCell:(UIButton *)btn{
    
}
@end
