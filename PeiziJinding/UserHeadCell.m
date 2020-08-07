//
//  UserHeadCell.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "UserHeadCell.h"

@implementation UserHeadCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSubView];
    }
    return self;
}

-  (void)dx_layoutSubView{
    [self.contentView addSubview:self.headImageView];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (UIImageView *)headImageView{
    if(!_headImageView){
        
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@"WeChat75003cb33413e29bab545512e08cf642"];
        _headImageView.backgroundColor = [UIColor redColor];
    }
    return _headImageView;
}

@end
