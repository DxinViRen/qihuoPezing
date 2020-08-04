//
//  HomeHeadCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/3.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "HomeHeadCell.h"

@implementation HomeHeadCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dxlayoutSubView];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)dxlayoutSubView{
    [self.contentView addSubview:self.mainLabel];
    [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).inset(15);
    }];
}

- (UILabel *)mainLabel {
    if(!_mainLabel){
        _mainLabel = [[UILabel alloc]init];
        _mainLabel.text = @"金鼎精选要闻";
        _mainLabel.textColor = MainColor;
        _mainLabel.font = [UIFont systemFontOfSize:15];
        _mainLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _mainLabel;
}
@end
