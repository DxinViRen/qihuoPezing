//
//  NewsListViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/6.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "NewsListViewController.h"
#import "NewsListDataModel.h"
#import "NewsCell.h"
#import <MJRefresh/MJRefresh.h>
#import "NewDetailsViewController.h"
#import "NewsNewDataModel.h"
@interface NewsListViewController ()
@property (nonatomic,strong)UIView *nodataView;
@property(nonatomic,strong)UILabel *nodataLabel;
@property(nonatomic,strong)UIImageView *haveNoDataView;
@property(nonatomic,strong)MBProgressHUD *hud;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSMutableArray *newsListArr;
@property(nonatomic,strong)NSArray *prArray;
@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self nodataViewHid];
    [self dxLayoutSubView];
    self.prArray = @[@"",@"202008071584794280" ,@"202008091586762117",@"202008071586335947",@"202008071585026080",@"202008061584362987",@"202008061583310178",@"202008061583055652",@"202008051582907626",@"202008051581384755",@"202008041581246981"];
    self.navigationItem.title = @"资讯";
    self.page = 0;
    self.dataArray = [@[] mutableCopy];
    self.newsListArr = [@[] mutableCopy];
    self.hud = [MBProgressHUD showMessage:@"请稍等"];
    
    [self configData];
    self.mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.mainCollectionView.mj_header beginRefreshing];
        self.page = 0;
        [self loadData];
    }];
    
    self.mainCollectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.mainCollectionView.mj_footer beginRefreshing];
        self.page++;
        [self loadData];
    }];
}

- (void)loadData{
    if(self.page == self.prArray.count){
        [self.mainCollectionView.mj_footer endRefreshingWithNoMoreData];
        self.page = 0;
        return;
    }
    if(self.page == 0){
        [self.dataArray removeAllObjects];
    }
    NSString *newurlStr = [NSString  stringWithFormat:NewsListUrl,[NSString stringWithFormat:@"%@",self.prArray[self.page]]];
    [[PSRequestManager shareInstance] netRequestWithUrl:newurlStr method:HttpRequestMethodPOST param:@{} successBlock:^(id  _Nullable responseObject, NSError * _Nullable seerror) {
        [self.hud hideAnimated:YES];
        [self.mainCollectionView.mj_header endRefreshing];
        [self.mainCollectionView.mj_footer endRefreshing];
        if(responseObject){
             NewsNewDataModel*listModel = [NewsNewDataModel mj_objectWithKeyValues:responseObject];
              //加载成功
                [self.newsListArr addObjectsFromArray:listModel.news];
                for (NewsDetaiItemModel *model in self.newsListArr) {
                    model.cellName = NSStringFromClass([NewsCell class]);
                    model.cellWight = Scr_w;
                    model.cellHeight = Scr_w*(95.0/Scr_w);
                    model.cellInderfier = NSStringFromClass([NewsCell class]);
                }
            [self.dataArray removeAllObjects];
            StorkSectionModel *secModel = [[StorkSectionModel alloc]initWithArray:self.newsListArr];
                [self.dataArray addObject:secModel];
                [self.adapter reloadDataWithCompletion:nil];
        }
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
        [self.hud hideAnimated:YES];
        [self nodataViewShow];
    }];
}

- (void)configData{
    [self loadData];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *sect  = [[StorkSectionController alloc]init];
    sect.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    sect.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        if([model.cellName isEqualToString:NSStringFromClass([NewsCell class])]){
            [[LoginManager shareInsetance] checkLogin:^{
                NewsDetaiItemModel *newModel = (NewsDetaiItemModel *)model;
                NewDetailsViewController *newDetai = [[NewDetailsViewController alloc]init];
                newDetai.model = newModel;
                [self.navigationController pushViewController:newDetai animated:YES];
            }];
        }
    
    };
    
    return sect;
}

- (void)dxLayoutSubView{
    [self.view addSubview:self.nodataView];
    [self.nodataView addSubview:self.nodataLabel];
    [self.nodataView addSubview:self.haveNoDataView];
    [self.nodataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-20);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    [self.haveNoDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nodataView).inset(15);
        make.centerX.equalTo(self.nodataView);
        make.size.mas_equalTo(CGSizeMake(128, 128));
    }];
    
    [self.nodataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.haveNoDataView.mas_bottom).offset(15);
        make.centerX.equalTo(self.haveNoDataView);
        make.height.mas_equalTo(20);
    }];
    
}

- (void)nodataViewShow{
    self.nodataView.hidden = NO;
}

- (void)nodataViewHid{
    self.nodataView.hidden = YES;
}

- (UIView *)nodataView{
    if(!_nodataView){
        
        _nodataView = [[UIView alloc]init];
    }
    return _nodataView;
}

- (UILabel *)nodataLabel{
    if(!_nodataLabel){
        
        _nodataLabel = [[UILabel alloc]init];
        _nodataLabel.textColor = [UIColor colorWithHexString:@"#707070"];
        _nodataLabel.text = @"你的资讯去了火星~~";
        [_nodataLabel sizeToFit];
    }
    return _nodataLabel;
}

- (UIImageView *)haveNoDataView{
    if(!_haveNoDataView){
        
        _haveNoDataView = [[UIImageView alloc]init];
        _haveNoDataView.image = [UIImage imageNamed:@"haveNoData"];
    }
    return _haveNoDataView;
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
