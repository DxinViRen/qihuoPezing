//
//  HomeViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/3.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderModelCellCollectionViewCell.h"
#import "HomeModel.h"
#import "HomeItemCell.h"
#import "HomeHeadCell.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configDataSource];
    [self.adapter reloadDataWithCompletion:nil];
}

- (void)configDataSource{
    HomeModel *homecycleModel = [[HomeModel alloc]init];
    homecycleModel.cellName = NSStringFromClass([HomeHeaderModelCellCollectionViewCell class]);
    homecycleModel.cellHeight = 200;
    homecycleModel.cellWight = Scr_w;
    
    HomeModel *homeBlankModel = [[HomeModel alloc]init];
    homeBlankModel.cellName = NSStringFromClass([MainCollectionViewCell class]);
    homeBlankModel.cellHeight = 10;
    homeBlankModel.cellWight = Scr_w;
    
    HomeModel *homeItemModel = [[HomeModel alloc]init];
    homeItemModel.cellName = NSStringFromClass([HomeItemCell class]);
    homeItemModel.cellWight = Scr_w;
    homeItemModel.cellHeight = Scr_w *(150/414.0);
    
    HomeModel *homeHeadModel = [[HomeModel alloc]init];
    homeHeadModel.cellName = NSStringFromClass([HomeHeadCell class]);
    homeHeadModel.cellHeight = 40;
    homeHeadModel.cellWight = Scr_w;
    
    HomeModel *homeBlankModel2 = [[HomeModel alloc]init];
       homeBlankModel2.cellName = NSStringFromClass([MainCollectionViewCell class]);
       homeBlankModel2.cellHeight = 10;
       homeBlankModel2.cellWight = Scr_w;
    
    
    NSMutableArray *dic = [[NSMutableArray alloc] initWithObjects:homecycleModel, homeBlankModel,homeItemModel,homeBlankModel2,homeHeadModel,nil];
    StorkSectionModel *secmodel = [[StorkSectionModel alloc]initWithArray:dic];
    self.dataArray = [[NSMutableArray alloc] initWithObjects:secmodel, nil];
    
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *stpct = [[StorkSectionController alloc]init];
    stpct.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    
    stpct.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        
    };
    
    return stpct;;
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
