//
//  MarketViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/6.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MarketViewController.h"
#import "MarketTabView.h"
#import "MarketRootModel.h"
#import "MarketDataView.h"
#import "MarketItemShowView.h"
#import "MarketDetailVC.h"

@interface MarketViewController ()<MarketTapClickprotocol,UIScrollViewDelegate>
@property(nonatomic,strong)MarketTabView *tabView;
@property(nonatomic,strong)MBProgressHUD *hud;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)UIScrollView *mainScrollView;
@property(nonatomic,strong)MarketDataView *dataView1;
@property(nonatomic,strong)MarketDataView *dataView2;
@property(nonatomic,strong)MarketDataView *dataView3;
@property(nonatomic,strong)MarketDataView *dataView4;
@property(nonatomic,strong)MarketRootModel *rootmodel;
@property(nonatomic,assign)CGFloat tabbarH;
@property(nonatomic,assign)CGFloat navigHs;
@property(nonatomic,strong)MarketItemShowView*itemshowView;
@property(nonatomic,strong)NSArray *mArr;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation MarketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabbarH  = self.tabBarController.tabBar.frame.origin.y;
    self.navigHs  = self.navigationController.navigationBar.frame.size.height + statusH;
    self.dataArray = [@[] mutableCopy];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F4F5F6"];
    [self loadData];
    [self dx_layoutSubView];
    [self loadIndexData];
    //self.timer =  [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    
}

- (void)timeAction{
    
    if(self.mArr.count  == self.mainScrollView.subviews.count){
        for (int i = 0; i <self.mainScrollView.subviews.count;i++) {
              MarketDataView *dataView = self.mainScrollView.subviews[i];
              MarketItemModel *itemnM = self.mArr[i];
              dataView.model =itemnM;
            dispatch_async(dispatch_get_main_queue(), ^{
                [dataView reloadData];
            });
        }
    }
  
}

- (void)dx_layoutSubView{
    [self.view addSubview:self.mainScrollView];
    [self.dataArray addObject:self.dataView1];
    [self.dataArray addObject:self.dataView2];
    [self.dataArray addObject:self.dataView3];
    [self.dataArray addObject:self.dataView4];
    
    //
    for (int i = 0; i <self.dataArray.count; i ++) {
        MarketDataView *dataView = self.dataArray[i];
        dataView.frame = CGRectMake(i *Scr_w, 0, Scr_w, self.mainScrollView.frame.size.height);
        dataView.clickBlock = ^(MarketDetailModel * _Nonnull mdoel) {
            //跳转详情
            MarketDetailVC *detailVC = [[MarketDetailVC alloc]init];
            detailVC.model = mdoel;
            [self.navigationController pushViewController:detailVC animated:YES];
        };
        dataView.tag = i;
       // dataView.model = self.rootmodel.data
        [self.mainScrollView addSubview:dataView];
    }
    self.itemshowView.frame = CGRectMake(0,  45, Scr_w, Scr_w * (78.0/375) - 45);
    [self.view addSubview:self.itemshowView];
//           [self.itemshowView mas_makeConstraints:^(MASConstraintMaker *make) {
//               make.left.and.right.equalTo(self.view);
//               make.top.equalTo(self.tabView.mas_bottom);
//               make.bottom.equalTo(self.mainScrollView.mas_top);
//           }];
   
}

- (void)loadIndexData{
    [[PSRequestManager shareInstance] netRequestWithUrl:@"https://api.tzch0.com/Index/ProDataA" method:HttpRequestMethodGET param:@{} successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
        MarketRootModel *dataRmodel = [MarketRootModel mj_objectWithKeyValues:responseObject];
        self.rootmodel.data.GJQH.list = dataRmodel.data.GJQH.list;
        self.rootmodel.data.GNQH.list = dataRmodel.data.GNQH.list;
        self.rootmodel.data.GZQH.list = dataRmodel.data.GZQH.list;
        self.rootmodel.data.WHQH.list = dataRmodel.data.WHQH.list;
        self.mArr = @[self.rootmodel.data.GJQH,self.rootmodel.data.GNQH,self.rootmodel.data.GZQH,self.rootmodel.data.WHQH];
        for (int i = 0; i <self.mainScrollView.subviews.count;i++) {
            MarketDataView *dataView = self.mainScrollView.subviews[i];
            MarketItemModel *itemnM = self.mArr[i];
            dataView.model =itemnM;
            if(i == 0){
                dispatch_async(dispatch_get_main_queue(), ^{
                    [dataView reloadData];
                });
            }
        }
        
        [self.tabView selectAtIndex:0];
        
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
        
    }];
}

- (void)loadData{
    self.hud = [MBProgressHUD showMessage:@"请稍等"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.hud hideAnimated:YES];
    });
    NSString *path = [[NSBundle mainBundle]pathForResource:@"MarketDataJson" ofType:@"plist"];
    NSDictionary *rootDic = [NSDictionary dictionaryWithContentsOfFile:path];
    self.rootmodel = [MarketRootModel mj_objectWithKeyValues:rootDic];
    if([self.rootmodel.code isEqualToString:@"200"]){
        NSArray *ttileArr = @[self.rootmodel.data.parent_classify_type.GJQH,self.rootmodel.data.parent_classify_type.GNQH,self.rootmodel.data.parent_classify_type.GZQH,self.rootmodel.data.parent_classify_type.WHQH];
        self.tabView = [[MarketTabView alloc]initWithDataArr:ttileArr];
        self.tabView.delegate = self;
       // self.tabView.backgroundColor = [UIColor orangeColor];
        self.tabView.frame
        = CGRectMake(0, 0, Scr_w, 45);
        [self.view addSubview:self.tabView];
    }
}

- (UIScrollView *)mainScrollView{
    if(!_mainScrollView){
       
        _mainScrollView = [[UIScrollView alloc]initWithFrame: CGRectMake(0,Scr_w * (78.0/375), Scr_w, self.tabbarH - self.navigHs - Scr_w * (78.0/375))];
        _mainScrollView.delegate = self;
        _mainScrollView.bounces = NO;
        _mainScrollView.contentSize = CGSizeMake(Scr_w * 4, 0);
        _mainScrollView.showsVerticalScrollIndicator = NO;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
        _mainScrollView.backgroundColor = [UIColor redColor];
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.scrollEnabled = YES;
    }
    return _mainScrollView;
}

- (MarketDataView *)dataView1{
    if(!_dataView1){
        
        _dataView1 = [[MarketDataView alloc]initWithSize:self.mainScrollView.frame.size];
        _dataView1.backgroundColor = [UIColor redColor];
    }
    return _dataView1;;
}

- (MarketDataView *)dataView2{
    if(!_dataView2){
        
        _dataView2 = [[MarketDataView alloc]initWithSize:self.mainScrollView.frame.size];
        _dataView2.backgroundColor = [UIColor cyanColor];
        
    }
    return _dataView2;;
}

- (MarketDataView *)dataView3{
    if(!_dataView3){
        
        _dataView3 = [[MarketDataView alloc]initWithSize:self.mainScrollView.frame.size];
        
        _dataView3.backgroundColor = [UIColor orangeColor];
    }
    return _dataView3;
}

- (MarketDataView *)dataView4{
    if(!_dataView4){
        
        _dataView4 = [[MarketDataView alloc]initWithSize:self.mainScrollView.frame.size];
        _dataView4.backgroundColor = [UIColor yellowColor];
    }
    return _dataView4;;
}

- (MarketItemShowView *)itemshowView{
    if(!_itemshowView){
        
        _itemshowView = [[MarketItemShowView alloc]init];
    }
    return _itemshowView;
}


#pragma mark - MarketTabViewProtocol
- (MarketTabView *)marketTabItemClick:(MarketTabView *)tabView item:(id)item index:(NSInteger)index{
    CGPoint position = CGPointMake(index*Scr_w, 0);
    MarketDataView *dataView = self.mainScrollView.subviews[index];
    dispatch_async(dispatch_get_main_queue(), ^{
                                 [dataView reloadData];
                                    });
   // [self.tabView selectAtIndex:0];
    [self.mainScrollView setContentOffset:position animated:YES];
    return self.tabView;
}

#pragma mark -UIscrViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page =  scrollView.contentOffset.x/Scr_w;
    MarketDataView *dataView = self.mainScrollView.subviews[page];
      dispatch_async(dispatch_get_main_queue(), ^{
                                   [dataView reloadData];
                                      });
    [self.tabView selectAtIndex:page];
}

- (void)dealloc
{
    [self.timer invalidate];
    self.timer = nil;
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
