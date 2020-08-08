//
//  MarketTabView.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/8.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketTabView.h"

#define SELECTCOLOR  [UIColor colorWithHexString:@"#DF041C"]
#define UNSELECTCOLOR [UIColor colorWithHexString:@"#C09843"]
@interface MarketTabView ()
@property (nonatomic,strong)NSArray * titleArray;
@property (nonatomic,strong)NSMutableArray *itemArrar;
@end


@implementation MarketTabView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self dx_layoutSubview];
        
    }
    return self;
}

- (void)dx_layoutSubview{
    CGFloat width =(Scr_w - 4)/5.0;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton *selectBtn = [[UIButton alloc]initWithFrame:CGRectMake(i*(width + 1), 0, width,self.frame.size.height)];
        selectBtn.tag = i;
        [selectBtn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [self addSubview:selectBtn];
        [selectBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
         [self.itemArrar addObject:selectBtn];
        UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(selectBtn.frame.origin.x + width, 5, 0.8, selectBtn.frame.size.height - 10)];
        [self addSubview:lineview];
    }
}

- (void)btnClick:(UIButton *)btn{
    if([self.delegate respondsToSelector:@selector(marketTabItemClick:item:index:)]){
        [self.delegate marketTabItemClick:self item:btn index:btn.tag];
    }
}

- (instancetype)initWithDataArr:(NSArray *)titleArr{
    if(self == [super init]){
        self.titleArray = [titleArr copy];
        self.itemArrar = [@[] mutableCopy];
    }
    return self;
}

- (void)selectAtIndex:(NSInteger)index{
    for (UIButton *btn in self.itemArrar) {
        if(btn.tag == index){
            btn.titleLabel.textColor =SELECTCOLOR;
        }else{
            btn.titleLabel.textColor = UNSELECTCOLOR;
        }
    }
}



@end
