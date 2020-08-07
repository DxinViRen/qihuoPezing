//
//  CalSelectCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CalSelectCell.h"
#import "DateTool.h"

@interface CalSelectCell ()
@property (nonatomic,strong)UILabel *mounthLable;
@property (nonatomic,strong)UIImageView *iconImgview;
@property (nonatomic,strong)UIView *lineView;
@property (nonatomic,strong)UIView *leftBgView;
@property (nonatomic,strong)NSMutableArray *btnArr;
@end

@implementation CalSelectCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.btnArr = [@[] mutableCopy];
        [self dx_LayoutSubview];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}


- (void)dx_LayoutSubview{
    [self.contentView addSubview:self.leftBgView];
    [self.leftBgView addSubview:self.lineView];
    [self.leftBgView addSubview:self.mounthLable];
    [self.leftBgView addSubview:self.iconImgview];
    [self.leftBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(75);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.centerY.equalTo(self.leftBgView);
        make.width.mas_equalTo(0.6);
        make.top.equalTo(self.contentView).inset(8);
    }];
    [self.mounthLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.leftBgView).inset(5);
        make.top.equalTo(self.leftBgView).inset(10);
    }];
    [self.iconImgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.leftBgView);
        make.bottom.equalTo(self.leftBgView).inset(15);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    NSArray *weekArr = [DateTool getWeekArr];
    NSArray *dateArr = [DateTool getDateArr];
    CGFloat btnw =  (Scr_w - 75)/7.0;
    for (int i = 0; i <7; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(75+i*btnw, 0, btnw, btnw);
        btn.tag = i;
        btn.layer.cornerRadius = btnw * 0.5;
        [btn setTitle:weekArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithHexString:@"#C09843"] forState:UIControlStateNormal];
        //[btn addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        [self.btnArr addObject:btn];
        
        UIButton *textBtn = [[UIButton alloc]init];
        textBtn.frame = CGRectMake(75+i*btnw, btnw, 25, 25);
        textBtn.tag = i + 100;
        textBtn.center = CGPointMake(btn.center.x, btn.center.y + btnw * 0.5 + 12.5);
        textBtn.layer.cornerRadius =12.5;
        textBtn.titleLabel.textAlignment  = NSTextAlignmentCenter;
        [textBtn setTitle:dateArr[i] forState:UIControlStateNormal];
        textBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [textBtn addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [textBtn setTitleColor:[UIColor colorWithHexString:@"#C09843"] forState:UIControlStateNormal];
        [self.contentView addSubview:textBtn];
        [self.btnArr addObject:textBtn];
    }
}

-  (void)btnClickAction:(UIButton *)btn{
    NSInteger tag = btn.tag;
    for (UIButton * mbtn in self.btnArr) {
        if(mbtn.tag == tag){
            mbtn.backgroundColor = [[UIColor colorWithHexString:@"#2A8EF8"]colorWithAlphaComponent:0.6];
        }else{
            mbtn.backgroundColor = [[UIColor colorWithHexString:@"#ffffff"]colorWithAlphaComponent:0.6];
        }
    }
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"clickDate" object:nil userInfo:@{@"tag":@(btn.tag)}];
}

- (UILabel *)mounthLable{
    if(!_mounthLable){
        _mounthLable = [[UILabel alloc]init];
        _mounthLable.text = [NSString stringWithFormat:@"%@月",[DateTool getMounthStr]];
        _mounthLable.textColor = [UIColor colorWithHexString:@"#C09843"];
        _mounthLable.textAlignment = NSTextAlignmentCenter;
        
    }
    return _mounthLable;
}

- (UIView *)lineView{
    if(!_lineView){
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#999999"];
        //_lineView.backgroundColor = [UIColor redColor];
    }
    return _lineView;
}
- (UIView *)leftBgView{
    if(!_leftBgView){
        
        _leftBgView = [[UIView alloc]init];
       // _leftBgView.backgroundColor = [UIColor redColor];
        
    }
    return _leftBgView;
}

- (UIImageView *)iconImgview{
    if(!_iconImgview){
        
        _iconImgview = [[UIImageView alloc]init];
        _iconImgview.image = [UIImage imageNamed:@"caldanIcon"];
    }
    return _iconImgview;
}

@end
