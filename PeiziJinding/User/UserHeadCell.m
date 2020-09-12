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
        //self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-  (void)dx_layoutSubView{
    [self.contentView addSubview:self.headImageView];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).inset(10);
    }];
}

- (UIImageView *)headImageView{
    if(!_headImageView){
        
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@"111599901642"];
        _headImageView.backgroundColor = [UIColor redColor];
        _headImageView.layer.cornerRadius = 8;
        _headImageView.clipsToBounds = YES;
    }
    return _headImageView;
}

@end
