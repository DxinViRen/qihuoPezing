//
//  MarketDataCellTableViewCell.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketDataCellTableViewCell.h"

@interface MarketDataCellTableViewCell ()
@property(nonatomic,strong)UILabel *mTitleLabel;
@end

@implementation MarketDataCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self dxLayoutSubView];
    }
    return self;
}

- (void)dxLayoutSubView{
   
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
