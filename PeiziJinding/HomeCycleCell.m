//
//  HomeCycleCell.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/29.
//  Copyright © 2020 koryv. All rights reserved.

#import "HomeCycleCell.h"
#import "GYRollingNoticeView.h"
#import "GYRollingNoticeView.h"
#import "HomegyNotiCell.h"
@interface HomeCycleCell ()<GYRollingNoticeViewDelegate,GYRollingNoticeViewDataSource>
@property (nonatomic,strong)GYRollingNoticeView *rollView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UIImageView *noticeImgView;
@end

@implementation HomeCycleCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = [[NSMutableArray alloc]init];
        [self dx_layoutSubView];
        [self configDataSource];
        [self.rollView beginScroll];
         [_rollView registerClass:[HomegyNotiCell class] forCellReuseIdentifier:@"GYNoticeViewCell"];
        
    }
    return self;
}

- (void)configDataSource{
    NSArray *titA = @[@"以史为鉴，黄金牛市到哪里算结束？",@"根本停不下来，黄金爆拉超30美元",@"期市收盘：商品期货多数下跌 鸡蛋主力跌近3%"];
    NSArray *imgA = @[@"WeChatc7d157474124087b4f3ea04a23c8967c",@"home_roll_A",@"home_roll_zhong"];
    NSArray *colA = @[@"#876543",@"#567844",@"#123432"];
    for (int i = 0; i<3; i++) {
        HomeModel *headM = [[HomeModel alloc]init];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:titA[i],@"title",imgA[i],@"img",colA[i],@"color" ,nil];
        headM.extra =[dic mutableCopy];
        [self.dataArray addObject:headM];

    }
    
}
- (void)dealloc
{
    [self.rollView.timer invalidate];
}


- (void)dx_layoutSubView{
    [self.contentView addSubview:self.rollView];
    [self.contentView addSubview:self.noticeImgView];
    
    [self.noticeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(self.contentView).inset(10);
    }];
    
    [self.rollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.noticeImgView.mas_right).offset(10);
        make.right.equalTo(self.contentView).inset(10);
        make.top.and.bottom.equalTo(self.contentView);
    }];
}

- (UIImageView *)noticeImgView{
    if(!_noticeImgView){
        
        _noticeImgView = [[UIImageView alloc]init];
        _noticeImgView.image = [UIImage imageNamed:@"labaIcon"];
    }
    return _noticeImgView;
}

- (GYRollingNoticeView *)rollView{
    if(!_rollView){
        _rollView = [[GYRollingNoticeView alloc]initWithFrame:CGRectZero];
       // _rollView.backgroundColor = [UIColor redColor];
        _rollView.delegate =  self;
        _rollView.dataSource = self;
    }
    return _rollView;
}

//  点击事件
- (void)didClickRollingNoticeView:(GYRollingNoticeView *)rollingView forIndex:(NSUInteger)index{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"cycleClick" object:nil userInfo:@{@"index":@(index)}];
}

- (NSInteger)numberOfRowsForRollingNoticeView:(GYRollingNoticeView *)rollingView{
    return 3;
}
- (GYNoticeViewCell *)rollingNoticeView:(GYRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index{
    HomegyNotiCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"GYNoticeViewCell"];
    if(cell == nil){
        cell = [[HomegyNotiCell alloc]initWithReuseIdentifier:@"GYNoticeViewCell"];
    }
    if(self.dataArray.count
       >index){
         cell.model = self.dataArray[index];
        //
    }
   
    return cell;
}

@end
