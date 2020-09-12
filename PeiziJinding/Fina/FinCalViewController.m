//
//  FinCalViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/7.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "FinCalViewController.h"
#import "FinCalModel.h"
#import "CalSelectCell.h"
#import "CalNewsCell.h"
#import "CalNewsModel.h"
#import "CalResponseModel.h"
@interface FinCalViewController ()
@property(nonatomic,strong)MBProgressHUD *hud;
//@property (nonatomic,strong)UIView *nodataView;
//@property(nonatomic,strong)UILabel *nodataLabel;
//@property(nonatomic,strong)UIImageView *haveNoDataView;
@end

@implementation FinCalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"财经日历";
    [self dxLayoutSubView];
    self.dataArray = [@[]  mutableCopy];
    [self configData];
    [self.adapter reloadDataWithCompletion:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clickDate:) name:@"clickDate" object:nil];
    [self dx_initData];
    
}

//- (void)nodataViewShow{
//    self.nodataView.hidden = NO;
//}
//
//- (void)nodataViewHid{
//    self.nodataView.hidden = YES;
//}

- (void)dx_initData{
      
        NSString *allstr = [NSString stringWithFormat:@"%@%@",[DateTool getCurrentDateStr],[DateTool getDateStr]];
       [self loadDataWithDate:allstr];
}

- (void)clickDate:(NSNotification *)noti{
    //刷新列表
    if(self.dataArray.count>1){
         [self.dataArray removeObjectAtIndex:1];
    }
    NSDictionary *dic = noti.userInfo;
    NSNumber * date = dic[@"tag"];
    NSInteger index = [date integerValue]-100;
    NSArray *dateArr =  [DateTool getDateArr];
    NSString *dateStr = [DateTool getCurrentDateStr];
    NSString *allstr = [NSString stringWithFormat:@"%@%@",dateStr,[dateArr objectAtIndex:index]];
    [self loadDataWithDate:allstr];
    
}

- (void)dxLayoutSubView{
//    [self.view addSubview:self.nodataView];
//    [self.nodataView addSubview:self.nodataLabel];
//    [self.nodataView addSubview:self.haveNoDataView];
//    [self.nodataView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.centerY.equalTo(self.view).offset(-20);
//        make.size.mas_equalTo(CGSizeMake(200, 200));
//    }];
//
//    [self.haveNoDataView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.nodataView).inset(15);
//        make.centerX.equalTo(self.nodataView);
//        make.size.mas_equalTo(CGSizeMake(128, 128));
//    }];
//
//    [self.nodataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.haveNoDataView.mas_bottom).offset(15);
//        make.centerX.equalTo(self.haveNoDataView);
//        make.height.mas_equalTo(20);
//    }];
    
}

- (void)loadDataWithDate:(NSString *)str{
    NSString *years = [str substringWithRange:NSMakeRange(0, 4)];
    NSString *months = [str substringWithRange:NSMakeRange(4, 4)];
   // NSString  * urlstr = [NSString stringWithFormat:CladanUrl,years,months]; ?&years=%@&MonthDay=%@
    self.hud = [MBProgressHUD showMessage:@"请稍等"];
    [[PSRequestManager shareInstance] netRequestWithUrl:CladanUrl  method:HttpRequestMethodPOST param:@{@"years":years,@"MonthDay":months} successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
        [self.hud hideAnimated:YES];
        NSMutableArray *sec2CellArr = [CalNewsModel mj_objectArrayWithKeyValuesArray:responseObject];

        for (CalNewsModel *newModel in sec2CellArr) {
                   newModel.cellName = NSStringFromClass([CalNewsCell class]);
                   newModel.cellHeight = Scr_w * (100/375.0);
                   newModel.cellWight = Scr_w;
                   newModel.cellInderfier = NSStringFromClass([CalNewsCell class]);
            }
            StorkSectionModel *sec2 = [[StorkSectionModel alloc]initWithArray:sec2CellArr];
                           [self.dataArray addObject:sec2];
            [self.adapter reloadDataWithCompletion:nil];
        //}
//        else{
//
//            //加载失败
//                           [MBProgressHUD showMessage:@"数据异常" toView:self.mainCollectionView];
//                          // [self nodataViewShow];
//        }
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
        [self.hud hideAnimated:YES];
        //[self nodataViewShow];
    }];
}

- (void)configData{
    FinCalModel *fmodle = [[FinCalModel alloc]init];
    fmodle.cellName = NSStringFromClass([CalSelectCell class]);
    fmodle.cellHeight  = ((Scr_w - 75)/7.0) + 35;
    fmodle.cellWight = Scr_w;
    fmodle.cellInderfier = NSStringFromClass([CalSelectCell class]);;
    NSMutableArray *sec1CellArr = [[NSMutableArray alloc]initWithObjects:fmodle, nil];
    StorkSectionModel *scModel1 = [[StorkSectionModel alloc]initWithArray:sec1CellArr];
    [self.dataArray addObject:scModel1];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *secC  = [[StorkSectionController alloc]init];
    secC.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    
    secC.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        
    };
    return secC;
}

//- (UIView *)nodataView{
//    if(!_nodataView){
//        
//        _nodataView = [[UIView alloc]init];
//    }
//    return _nodataView;
//}
//
//- (UILabel *)nodataLabel{
//    if(!_nodataLabel){
//        
//        _nodataLabel = [[UILabel alloc]init];
//        _nodataLabel.textColor = [UIColor colorWithHexString:@"#707070"];
//        _nodataLabel.text = @"你的资讯去了火星~~";
//        [_nodataLabel sizeToFit];
//    }
//    return _nodataLabel;
//}
//
//- (UIImageView *)haveNoDataView{
//    if(!_haveNoDataView){
//        _haveNoDataView = [[UIImageView alloc]init];
//        _haveNoDataView.image = [UIImage imageNamed:@"haveNoData"];
//    }
//    return _haveNoDataView;
//}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
