//
//  MyCollectViewController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/30.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MyCollectViewController.h"
#import "StorkSectionModel.h"
#import "StorkSectionController.h"
#import "NewsModel.h"
#import "NewDetailsViewController.h"
@interface MyCollectViewController ()
@property (nonatomic,strong)UILabel *mainLable;
@end

@implementation MyCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =  @"我的收藏";
    [self.view addSubview:self.collectImgView];
    [self.view addSubview:self.mainLable];
    [self.collectImgView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(0.5*Scr_w, 0.5*Scr_w));
    }];
    
    [self.mainLable mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.collectImgView);
        make.top.equalTo(self.collectImgView.mas_bottom).offset(10);
        
    }];
    
    self.collectImgView.hidden = YES;
    self.mainLable.hidden = YES;
   
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self configDataSource];
    [self.adapter reloadDataWithCompletion:nil];
    StorkSectionModel *model = self.dataArray[0];
    
    self.collectImgView.hidden = model.dataArray.count != 0;
    self.mainLable.hidden = model.dataArray.count  != 0;
}

- (void)configDataSource{
     NSArray *collA = [[NSUserDefaults standardUserDefaults]objectForKey:@"collectList"];
    NSMutableArray *modelArr  = [NewsNewModel mj_objectArrayWithKeyValuesArray:collA];
    StorkSectionModel *secModel = [[StorkSectionModel alloc]initWithArray:modelArr];
    self.dataArray = [[NSMutableArray alloc]initWithObjects:secModel, nil];
    
    
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *secCon = [[StorkSectionController alloc]init];
    secCon.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    
    secCon.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        
        [[LoginManager shareInsetance] checkLogin:^{
            NewsNewModel *newModel = (NewsNewModel *)model;
            NewDetailsViewController *newDetai = [[NewDetailsViewController alloc]init];
            newDetai.model = newModel;
            NSString *detaiUrl = [NSString stringWithFormat:DetailUrl,[NSString stringWithFormat:@"%ld",[newModel.ID longValue]]];
            [newDetai loadHtmlWithUrl:detaiUrl];
            [self.navigationController pushViewController:newDetai animated:YES];
        }];
    };
    
    return secCon;
}


- (UIImageView *)collectImgView{
    if(!_collectImgView){
        
        _collectImgView = [[UIImageView alloc]init];
        _collectImgView.image = [UIImage imageNamed:@"haveNoCollectNew"];
    }
    return _collectImgView;
}

- (UILabel *)mainLable{
    if(!_mainLable){
        
        _mainLable = [[UILabel alloc]init];
        _mainLable.textColor  = [UIColor  colorWithHexString:@"#5B5B5B"];
        _mainLable.font = [UIFont systemFontOfSize:14];
        _mainLable.text = @"你还没有收藏";
        _mainLable.textAlignment = NSTextAlignmentCenter;
    }
    return _mainLable;
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
