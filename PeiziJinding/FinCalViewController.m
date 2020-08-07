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
@interface FinCalViewController ()

@end

@implementation FinCalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"财经日历";
    self.dataArray = [@[]  mutableCopy];
    [self configData];
    [self.adapter reloadDataWithCompletion:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clickDate:) name:@"clickDate" object:nil];
    //[self loadData];
}

- (void)clickDate:(NSNotification *)noti{
    //刷新列表
    NSDictionary *dic = noti.userInfo;
    NSNumber * date = dic[@"tag"];
    NSInteger index = [date integerValue]-100;
    NSArray *dateArr =  [DateTool getDateArr];
    NSString *dateStr = [DateTool getCurrentDateStr];
    NSString *allstr = [NSString stringWithFormat:@"%@%@",dateStr,[dateArr objectAtIndex:index]];
    [self loadDataWithDate:allstr];
    
}

- (void)loadDataWithDate:(NSString *)str{
    NSString  * urlstr = [NSString stringWithFormat:CladanUrl,str];
    [[PSRequestManager shareInstance] netRequestWithUrl:urlstr  method:HttpRequestMethodGET param:@{} successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
        
        
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
        
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
