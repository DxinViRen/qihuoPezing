//
//  MarketDetailVC.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/12.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketDetailVC.h"
#import "YKLineChartView.h"
#import "YKLineDataSet.h"
#import "YKLineEntity.h"
@interface MarketDetailVC ()<YKLineChartViewDelegate>
@property(nonatomic,strong)NSArray *keyArray;
@property (strong, nonatomic)YKLineChartView *klineView;
@property (nonatomic,strong)NSArray *dateArr;
@property (nonatomic,strong)UIView *gardView;
@property (nonatomic,strong)UILabel *lastPriceLabe;
@property (nonatomic,strong)UILabel *dateLabel;
@property (nonatomic,strong)UILabel *zhangLabel;
@property (nonatomic,strong)UILabel *todayLabel;
@property (nonatomic,strong)UILabel *heightLabel;
@property (nonatomic,strong)UILabel *chiLabel;
@property (nonatomic,strong)UILabel *zhenfuLabel;
@property (nonatomic,strong)UILabel *lowLabel;
@property (nonatomic,strong)UILabel *yesLAbel;
@end

@implementation MarketDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.keyArray = @[@"data",@"data2",@"data3",@"data4"];
    self.dateArr= @[@"2020/08/09",@"2020/08/10",@"2020/08/11",@"2020/08/12",@"2020/08/07"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.9];
    self.navigationItem.title = self.model.cat_name;
    [self configPage:self.keyArray];
}

- (void )configPage:(NSArray*)arr{
    NSString * path =[[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];
    NSInteger va = arc4random()%4;
    NSArray * sourceArray = [[NSDictionary dictionaryWithContentsOfFile:path] objectForKey:arr[va]];
    NSMutableArray * array = [NSMutableArray array];
       for (NSDictionary * dic in sourceArray) {
           YKLineEntity * entity = [[YKLineEntity alloc]init];
           entity.high = [dic[@"high_px"] doubleValue];
           entity.open = [dic[@"open_px"] doubleValue];
           
           entity.low = [dic[@"low_px"] doubleValue];
           
           entity.close = [dic[@"close_px"] doubleValue];
           
           entity.date = self.dateArr[arc4random()%5];
           entity.ma5 = [dic[@"avg5"] doubleValue];
           entity.ma10 = [dic[@"avg10"] doubleValue];
           entity.ma20 = [dic[@"avg20"] doubleValue];
           entity.volume = [dic[@"total_volume_trade"] doubleValue];
           [array addObject:entity];
           //YTimeLineEntity * entity = [[YTimeLineEntity alloc]init];
       }
      
       [self.view addSubview: self.gardView];
       [self.gardView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.and.right.and.top.equalTo(self.view);
           make.height.mas_equalTo(104);
       }];
    
    [self.gardView addSubview:self.lastPriceLabe];
    [self.lastPriceLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.gardView).inset(8).priority(1000);
        make.height.mas_equalTo(32);
        make.top.equalTo(self.gardView).inset(8);
    }];
    
    [self.gardView addSubview:self.zhangLabel];
    [self.zhangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.lessThanOrEqualTo(self.lastPriceLabe.mas_right).offset(10).priority(300);
        make.top.equalTo(self.lastPriceLabe);
    }];
    
    [self.gardView addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.zhangLabel);
        make.top.equalTo(self.zhangLabel.mas_bottom);
    }];
    
    [self.gardView addSubview:self.todayLabel];
    [self.todayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.gardView).inset(8).priority(1000);
        make.top.equalTo(self.lastPriceLabe.mas_bottom).offset(10);
    }];
    
    [self.gardView addSubview:self.heightLabel];
    [self.heightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.todayLabel.mas_right).offset(45);
        make.centerY.equalTo(self.todayLabel);
    }];
    
    [self.gardView addSubview:self.chiLabel];
    [self.chiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.heightLabel.mas_right).offset(45);
        make.centerY.equalTo(self.todayLabel);
    }];
    
    [self.gardView addSubview:self.zhenfuLabel];
    [self.zhenfuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.todayLabel.mas_left).priority(1000);
        make.top.equalTo(self.todayLabel.mas_bottom).offset(10);
    }];
    
    [self.gardView addSubview:self.lowLabel];
    [self.lowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.heightLabel);
        make.centerY.equalTo(self.zhenfuLabel);
    }];
    
    [self.gardView addSubview:self.yesLAbel];
    [self.yesLAbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.chiLabel);
        make.centerY.equalTo(self.lowLabel);
    }];
    
    
    
       [array addObjectsFromArray:array];
       YKLineDataSet * dataset = [[YKLineDataSet alloc]init];
       dataset.data = array;
       dataset.highlightLineColor = [UIColor colorWithRed:60/255.0 green:76/255.0 blue:109/255.0 alpha:1.0];
       dataset.highlightLineWidth = 0.7;
       dataset.candleRiseColor = [UIColor colorWithRed:233/255.0 green:47/255.0 blue:68/255.0 alpha:1.0];
       dataset.candleFallColor = [UIColor colorWithRed:33/255.0 green:179/255.0 blue:77/255.0 alpha:1.0];
       dataset.avgLineWidth = 1.f;
       dataset.avgMA10Color = [UIColor colorWithRed:252/255.0 green:85/255.0 blue:198/255.0 alpha:1.0];
       dataset.avgMA5Color = [UIColor colorWithRed:67/255.0 green:85/255.0 blue:109/255.0 alpha:1.0];
       dataset.avgMA20Color = [UIColor colorWithRed:216/255.0 green:192/255.0 blue:44/255.0 alpha:1.0];
       dataset.candleTopBottmLineWidth = 1;
       [self.view addSubview:self.klineView];
    [self.klineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).inset(10);
        make.top.equalTo(self.gardView.mas_bottom);
        make.left.equalTo(self.view).inset(50);
        make.height.mas_equalTo(300);
    }];
      [self.klineView setupChartOffsetWithLeft:50 top:10 right:10 bottom:10];
       self.klineView.gridBackgroundColor = [UIColor whiteColor];
       self.klineView.borderColor = [UIColor colorWithRed:203/255.0 green:215/255.0 blue:224/255.0 alpha:1.0];
       self.klineView.borderWidth = .5;
       self.klineView.candleWidth = 8;
       self.klineView.candleMaxWidth = 30;
       self.klineView.candleMinWidth = 1;
       self.klineView.uperChartHeightScale = 0.7;
       self.klineView.xAxisHeitht = 25;
       self.klineView.delegate = self;
       self.klineView.highlightLineShowEnabled = YES;
       self.klineView.zoomEnabled = YES;
       self.klineView.scrollEnabled = YES;
       [self.klineView setupData:dataset];
     
}
- (YKLineChartView *)klineView{
    if(!_klineView){
        _klineView = [[YKLineChartView alloc]init];
        
    }
    return _klineView;
}

- (UIView *)gardView{
    if(!_gardView){
        
        _gardView = [[UIView alloc]init];
        if(self.model.pre_numArr.count == 5){
            if([self.model.pre_numArr[2] floatValue] >0){
                _gardView.backgroundColor = [UIColor colorWithHexString:@"#F92E3C"];
            }else{
                _gardView.backgroundColor  =  [UIColor colorWithHexString:@"#18C07E"];
            }
        }
    }
    return _gardView;
}
/**
 @property (nonatomic,strong)UILabel *lastPriceLabe;
 @property (nonatomic,strong)UILabel *dateLabel;
 @property (nonatomic,strong)UILabel *zhangLabel;
 @property (nonatomic,strong)UILabel *todayLabel;
 @property (nonatomic,strong)UILabel *heightLabel;
 @property (nonatomic,strong)UILabel *chiLabel;
 @property (nonatomic,strong)UILabel *zhenfuLabel;
 @property (nonatomic,strong)UILabel *lowLabel;
 @property (nonatomic,strong)UILabel *yesLAbel;
 */

- (UILabel *)lastPriceLabe{
    if(!_lastPriceLabe){
        
        _lastPriceLabe = [[UILabel alloc]init];
       // _lastPriceLabe.backgroundColor = [UIColor redColor];
        if(self.model.pre_numArr.count == 5){
            _lastPriceLabe.text =[NSString stringWithFormat:@"%@",self.model.pre_numArr[1]];
        }
        
        _lastPriceLabe.font  = [UIFont boldSystemFontOfSize:32];
        _lastPriceLabe.textColor = [UIColor whiteColor];
        _lastPriceLabe.textAlignment = NSTextAlignmentLeft;
        
    }
    return _lastPriceLabe;
}

- (UILabel *)chiLabel{
    if(!_chiLabel){
        _chiLabel = [[UILabel alloc]init];
        if(self.model.pre_numArr.count == 5){
            _chiLabel.text = [NSString stringWithFormat:@"持仓量 %@",self.model.pre_numArr[4]];
        }
        //_todayLabel.backgroundColor = [UIColor redColor];
        _chiLabel.font  = [UIFont boldSystemFontOfSize:13];
        _chiLabel.textColor = [UIColor whiteColor];
        _chiLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _chiLabel;
}

- (UILabel *)heightLabel{
    if(!_heightLabel){
        _heightLabel = [[UILabel alloc]init];
        if(self.model.pre_numArr.count == 5){
            _heightLabel.text = [NSString stringWithFormat:@"最高 %@",self.model.pre_numArr[1]];
        }
        //_todayLabel.backgroundColor = [UIColor redColor];
        _heightLabel.font  = [UIFont boldSystemFontOfSize:13];
        _heightLabel.textColor = [UIColor whiteColor];
        _heightLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _heightLabel;
}

- (UILabel *)dateLabel{
    if(!_dateLabel){
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = [DateTool gettodayStr];
        _dateLabel.font  = [UIFont boldSystemFontOfSize:13];
        _dateLabel.textColor = [UIColor whiteColor];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _dateLabel;
}

- (UILabel *)todayLabel{
    if(!_todayLabel){
        _todayLabel = [[UILabel alloc]init];
        if(self.model.pre_numArr.count == 5){
            _todayLabel.text = [NSString stringWithFormat:@"今开 %@",self.model.pre_numArr[1]];
        }
        //_todayLabel.backgroundColor = [UIColor redColor];
        _todayLabel.font  = [UIFont boldSystemFontOfSize:13];
        _todayLabel.textColor = [UIColor whiteColor];
        _todayLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _todayLabel;
}


- (UILabel *)zhangLabel{
    if(!_zhangLabel){
        
        _zhangLabel = [[UILabel alloc]init];
       // _zhangLabel.backgroundColor = [UIColor redColor];
        if(self.model.pre_numArr.count == 5){
            _zhangLabel.text = self.model.pre_numArr[2];
        }
        _zhangLabel.font  = [UIFont boldSystemFontOfSize:13];
        _zhangLabel.textColor = [UIColor whiteColor];
        _zhangLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _zhangLabel ;
}

- (UILabel *)zhenfuLabel{
    if(!_zhenfuLabel){
        _zhenfuLabel = [[UILabel alloc]init];
        if(self.model.pre_numArr.count == 5){
            _zhenfuLabel.text = [NSString stringWithFormat:@"振幅 %@",[NSString stringWithFormat:@"%.2f%%",arc4random()%100/100.0]];
        }
        //_todayLabel.backgroundColor = [UIColor redColor];
        _zhenfuLabel.font  = [UIFont boldSystemFontOfSize:13];
        _zhenfuLabel.textColor = [UIColor whiteColor];
        _zhenfuLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _zhenfuLabel;
}

- (UILabel *)lowLabel{
    if(!_lowLabel){
        _lowLabel = [[UILabel alloc]init];
       
        if(self.model.pre_numArr.count == 5){
            _lowLabel.text = [NSString stringWithFormat:@"最低 %.2f", [self.model.pre_numArr[1] floatValue] -arc4random()%10/100.0];
        }
        //_todayLabel.backgroundColor = [UIColor redColor];
        _lowLabel.font  = [UIFont boldSystemFontOfSize:13];
        _lowLabel.textColor = [UIColor whiteColor];
        _lowLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _lowLabel;
}

- (UILabel *)yesLAbel{
    if(!_yesLAbel){
        
        _yesLAbel = [[UILabel alloc]init];
        if(self.model.pre_numArr.count == 5){
            _yesLAbel.text = [NSString stringWithFormat:@"昨结算 %.2f", [self.model.pre_numArr[1] floatValue] +arc4random()%22/100.0];
        }
        //_todayLabel.backgroundColor = [UIColor redColor];
        _yesLAbel.font  = [UIFont boldSystemFontOfSize:13];
        _yesLAbel.textColor = [UIColor whiteColor];
        _yesLAbel.textAlignment = NSTextAlignmentLeft;
    }
    
    return _yesLAbel;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
