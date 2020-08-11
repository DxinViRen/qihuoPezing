//
//  MainViewController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
     [self setupUI];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f0f0f0"];
    [self dxConfigData];
    //[self dxLayoutSubview];
    
}

- (void)dxConfigData{}
- (void)dxLayoutSubview{}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
   
}
- (void)setupUI
{
    self.adapter.collectionView = self.mainCollectionView;
    self.adapter.dataSource = self;
    self.adapter.scrollViewDelegate = self;
    [self.view addSubview:self.mainCollectionView];
}
- (void)viewDidLayoutSubviews
{
    self.mainCollectionView.frame = [self collectionViewFrame];
}
- (CGRect)collectionViewFrame
{
    return self.view.bounds;
}

#pragma mark - IGlistAdapterDataSource
- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return nil;
}
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object
{
    return nil;
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    UIView *haveNeo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
      [haveNeo addSubview:self.haveNoDataView];
      [haveNeo addSubview:self.nodataLabel];
      [self.haveNoDataView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.center.equalTo(haveNeo);
          make.size.mas_equalTo(CGSizeMake(128, 128));
      }];
      
      [self.nodataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.equalTo(self.haveNoDataView.mas_bottom).offset(10);
          make.centerX.equalTo(haveNeo);
      }];
      
      return haveNeo;
    return nil;
}

#pragma mark  - DZNEmptyDataSource
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

#pragma mark - getter
- (UICollectionView *)mainCollectionView
{
    if(!_mainCollectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _mainCollectionView = [[UICollectionView alloc]initWithFrame:self.view.safeAreaLayoutGuide.layoutFrame
                                                collectionViewLayout:layout];
        _mainCollectionView.backgroundColor = [UIColor clearColor];
        _mainCollectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _mainCollectionView;
}

- (IGListAdapter *)adapter
{
    if(!_adapter)
    {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[[IGListAdapterUpdater alloc]init] viewController:self workingRangeSize:0];
    }
    return _adapter;
}

- (NSMutableArray *)dataArray
{
    if(!_dataArray)
    {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (UILabel *)nodataLabel{
    if(!_nodataLabel){
        
        _nodataLabel = [[UILabel alloc]init];
        _nodataLabel.textColor = [UIColor colorWithHexString:@"#707070"];
        //_nodataLabel.text = @"暂无数据";
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
