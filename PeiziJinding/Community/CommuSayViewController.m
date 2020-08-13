//
//  CommuSayViewController.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/10.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "CommuSayViewController.h"
#import "CommRootModel.h"
#import "CommItemDataCell.h"
#import "DateTool.h"
#import "CommShareVCViewController.h"
#import "ComReviewsViewController.h"
#import "CommSayDetailVC.h"
@interface CommuSayViewController ()

@property(nonatomic,strong)MBProgressHUD *hud;
//@property(nonatomic,strong)UILabel *nodataLabel;
//@property(nonatomic,strong)UIImageView *haveNoDataView;
@end

@implementation CommuSayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nodataLabel.text = @"暂无数据";
    self.dataArray = [@[] mutableCopy];
    [self configData];
    [self loadData];
    self.mainCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           [self loadData];
       }];
       self.mainCollectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           [self loadData];
       }];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(shareAction:) name:@"share" object:nil];
}

- (void)shareAction:(NSNotification *)noti{
    CommShareVCViewController *share = [[CommShareVCViewController alloc]init];
    share.dataModel = noti.userInfo[@"model"];
    [self.navigationController pushViewController:share animated:YES];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

- (void)configData{
    [self loadData];
}

- (void)loadData{
    [self.dataArray removeAllObjects];
  //  self.hud = [MBProgressHUD showMessage:@"请稍等..."];
    [[PSRequestManager shareInstance] netRequestWithUrl:@"https://quanzi.cngold.org/say/hotLine/2099016/0/50/?version=2.1" method:HttpRequestMethodGET param:@{} successBlock:^(id  _Nullable responseObject, NSError * _Nullable error) {
        [self.mainCollectionView.mj_header endRefreshing];
                   [self.mainCollectionView.mj_footer endRefreshingWithNoMoreData];
        CommRootModel *model = [CommRootModel mj_objectWithKeyValues:responseObject];
        NSMutableArray *cellArr = [@[] mutableCopy];
        
         [self.hud hideAnimated:YES];
        if(model.data.count>0){
            for (CommDataModel *datam in model.data) {
                datam.cellName = NSStringFromClass([CommItemDataCell class]);
                datam.cellWight = Scr_w;
                CGFloat cellh = 0;
                if(datam.say.pics.count>0){
                     cellh = [DateTool getStringHeightWithText:datam.say.content font:[UIFont systemFontOfSize:15] viewWidth:Scr_w] +105+110+130;
                }else{
                     cellh = [DateTool getStringHeightWithText:datam.say.content font:[UIFont systemFontOfSize:15] viewWidth:Scr_w] +65+85;
                }
               
                datam.cellHeight = cellh;
                datam.cellInderfier = NSStringFromClass([CommItemDataCell class]);
                [cellArr addObject:datam];
            }
            StorkSectionModel *secModel = [[StorkSectionModel alloc]initWithArray:cellArr];
            [self.dataArray addObject:secModel];
            [self.adapter reloadDataWithCompletion:nil];
        }
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
        [self.hud hideAnimated:YES];
        [self.mainCollectionView.mj_header endRefreshing];
                   [self.mainCollectionView.mj_footer endRefreshingWithNoMoreData];
    }];
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
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}


- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *section = [[StorkSectionController alloc]init];
    section.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        CommItemDataCell *comCell = (CommItemDataCell *)cell;
               comCell.shablock = ^(CommDataModel * _Nonnull sharemodel) {
                   CommShareVCViewController *share = [[CommShareVCViewController alloc]init];
                   share.dataModel =sharemodel;
                   [self.navigationController pushViewController:share animated:YES];
               };
               
               __weak typeof(self) weakself = self;
               comCell.reBlock = ^(CommDataModel * _Nonnull sharemodel) {
                   ComReviewsViewController *comre = [[ComReviewsViewController alloc]init];
                   comre.makeBlock = ^{
                       NSInteger revc = [sharemodel.say.countOfComment intValue];
                       revc++;
                       sharemodel.say.countOfComment = [NSString stringWithFormat:@"%ld",revc];
                       [weakself.adapter reloadDataWithCompletion:nil];
                   };
                   [self.navigationController pushViewController:comre animated:YES];
               };
    };
    section.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        CommSayDetailVC *detailV = [[CommSayDetailVC alloc]init];
        detailV.dataModel = (CommDataModel *)model;
        [self.navigationController pushViewController:detailV animated:YES];
    };
    return section;
}

- (CGSize)getImageSizeWithURL:(NSURL *)url
{
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
    CGFloat width = 0.0f, height = 0.0f;
    
    if (imageSource)
    {
        CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL);
        
        if (imageProperties != NULL)
        {
            CFNumberRef widthNum  = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
            if (widthNum != NULL) {
                CFNumberGetValue(widthNum, kCFNumberFloatType, &width);
            }
            
            CFNumberRef heightNum = CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
            if (heightNum != NULL) {
                CFNumberGetValue(heightNum, kCFNumberFloatType, &height);
            }
            
            CFRelease(imageProperties);
        }
        CFRelease(imageSource);
        NSLog(@"Image dimensions: %.0f x %.0f px", width, height);
    }
    return CGSizeMake(width, height);
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
