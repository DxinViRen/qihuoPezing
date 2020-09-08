//
//  StudyVc.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/18.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "StudyVc.h"
#import "StudyModel.h"
#import "StudayCell.h"
#import "PlaymVC.h"
@interface StudyVc ()

@end

@implementation StudyVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"期货学堂";
    self.dataArray = [@[] mutableCopy];
    [self configData];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f6f6f6"];
    
}

- (void)configData{
    [self loadData];
    [self.adapter reloadDataWithCompletion:nil];
   
}

- (void)loadData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"StudayRo" ofType:@"plist"];
    NSMutableArray *modelArr = [[NSMutableArray alloc]initWithContentsOfFile:path];
   NSMutableArray *dataA = [StudyModel mj_objectArrayWithKeyValuesArray:modelArr];
    NSMutableArray *muArr = [@[] mutableCopy];
    for (StudyModel *model in dataA) {
        model.cellName = NSStringFromClass([StudayCell class]);
        model.cellHeight = 120;
        model.cellWight = Scr_w;
        model.cellInderfier = NSStringFromClass([StudayCell class]);
        [muArr addObject:model];
    }
    
    StorkSectionModel *secm = [[StorkSectionModel alloc]initWithArray:muArr];
    [self.dataArray addObject:secm];
    
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *secC = [[StorkSectionController alloc]init];
    secC.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    
    secC.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        PlaymVC *plm = [[PlaymVC alloc]init];
        plm.model = (StudyModel *)model;
        [self.navigationController pushViewController:plm animated:YES];
        
    };
    
    return secC;
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
