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
#import "HomeCycleCell.h"
#import "NewDetailsViewController.h"
#import "NewsCell.h"
#import "NewsListDataModel.h"
#import "AppDelegate.h"
#import "FinCalViewController.h"
#import "NewsListViewController.h"
#import "MyCollectViewController.h"
#import "NewsNewDataModel.h"
#import "StudyVc.h"
#import "NewsDetaiItemModel.h"
#import "NewsNewModel.h"
#import "NewsModel.h"
#import "NewsRotModel.h"
@interface HomeViewController ()
@property(nonatomic,strong)NSArray *bannerUrlArr;
@property(nonatomic,strong)NSArray *cycleUrlArr;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,assign)NSInteger month;
@property(nonatomic,strong)NSMutableArray *newsListArr;
@property(nonatomic,strong)UIView *hudBackView;
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.newsListArr = [@[] mutableCopy];
    self.dataArray = [@[] mutableCopy];
    self.page = 1;
    self.month =  4;
    [self configDataSource];
    //NSArray *arr = [DateTool getWeekArr];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clickBanAction:) name:@"clickBanner" object:nil];
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cycleClickAction:) name:@"cycleClick" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moreNews:) name:@"more" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(itemClick:) name:@"itemClick" object:nil];
    self.bannerUrlArr = @[@"64605",@"64601",@"64602"];
    self.cycleUrlArr = @[@"64598",@"64597",@"64595"];
    
   
}



- (void)itemClick:(NSNotification *)noti{
    NSInteger  tag = [noti.userInfo[@"tag"] intValue];
    if(tag == 100|| tag == 1000){
        //财经日历
        FinCalViewController  *finc = [[FinCalViewController alloc]init];
        [self.navigationController pushViewController:finc animated:YES];
    }else if (tag == 200 || tag == 2000){
        //期货行情
//        AppDelegate *delegate =(AppDelegate *) [UIApplication sharedApplication].delegate;
//        UIWindow *win  = delegate.window;
//        StockRootViewController *root = (StockRootViewController *)win.rootViewController;
//        [root setSelectedIndex:1];
        StudyVc *study = [[StudyVc alloc]init];
        [self.navigationController pushViewController:study animated:YES];
        
        
    }else if (tag  == 300 || tag == 3000){
        //我的收藏
               MyCollectViewController *mycll = [[MyCollectViewController alloc]init];
               [self.navigationController pushViewController:mycll animated:YES];
       
    }else if (tag == 400 || tag == 4000){
       //热门资讯
              NewsListViewController *news = [[NewsListViewController alloc]init];
              [self.navigationController pushViewController:news animated:YES];
    }
    
}

- (void)moreNews:(NSNotification *)noti{
    //more
    NewsListViewController *newsli = [[NewsListViewController alloc]init];
    [self.navigationController pushViewController:newsli animated:YES];
}

- (void)loadData{
    [self.mainCollectionView.mj_header beginRefreshing];
   
         self.hud = [MBProgressHUD showMessage:@"请稍等"];
        
    if(self.page == 0){
        [self.mainCollectionView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
   // NSString *newurlStr = [NSString  stringWithFormat:NewsListUrl,[NSString stringWithFormat:@"%@",@""]];
    [[PSRequestManager shareInstance] netRequestWithUrl:NewsListUrl method:HttpRequestMethodPOST param:@{@"p":@"1"} successBlock:^(id  _Nullable responseObject, NSError * _Nullable seerror) {
        [self.hud hideAnimated:YES];
        [self.mainCollectionView.mj_header endRefreshing];
        if(responseObject){
            NewsRotModel *listModel = [NewsRotModel mj_objectWithKeyValues:responseObject];
                //加载成功
                [self.newsListArr addObjectsFromArray:listModel.data];
                for (NewsNewModel *model in self.newsListArr) {
                    model.cellName = NSStringFromClass([NewsCell class]);
                    model.cellWight = Scr_w;
                    model.cellHeight = Scr_w*(95.0/Scr_w);
                    model.cellInderfier = NSStringFromClass([NewsCell class]);
                }
                StorkSectionModel *secModel = [[StorkSectionModel alloc]initWithArray:self.newsListArr];
                
                [self.dataArray addObject:secModel];
                [self.adapter reloadDataWithCompletion:nil];
        }
    } failure:^(id  _Nullable responseObject, NSError * _Nullable error) {
        [self.hud hideAnimated:YES];
    }];
}

- (void)cycleClickAction:(NSNotification *)noti{
    NSDictionary *dic  = noti.userInfo;
    NSInteger index = [dic[@"index"] integerValue];
    NewDetailsViewController *news = [[NewDetailsViewController alloc]init];
    news.tid = self.cycleUrlArr[index];
    [self.navigationController pushViewController:news animated:YES];
    
}

- (void)clickBanAction:(NSNotification *)noti{
    NSDictionary *dic  = noti.userInfo;
    NSInteger index = [dic[@"index"] integerValue];
    
    NewDetailsViewController *news = [[NewDetailsViewController alloc]init];
    //news.url = self.bannerUrlArr [index];
    news.tid = self.bannerUrlArr[index];
    [self.navigationController pushViewController:news animated:YES];
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
    
    HomeModel *homeLaModel = [[HomeModel alloc]init];
    homeLaModel.cellName = NSStringFromClass([HomeCycleCell class]);
    homeLaModel.cellWight = Scr_w;
    homeLaModel.cellHeight = 30;
    homeLaModel.cellInderfier = NSStringFromClass([HomeCycleCell class]);
    
    HomeModel *homeBlankModel1 = [[HomeModel alloc]init];
    homeBlankModel1.cellName = NSStringFromClass([MainCollectionViewCell class]);
    homeBlankModel1.cellHeight = 10;
    homeBlankModel1.cellWight = Scr_w;
    
    HomeModel *homeItemModel = [[HomeModel alloc]init];
    homeItemModel.cellName = NSStringFromClass([HomeItemCell class]);
    homeItemModel.cellWight = Scr_w;
    homeItemModel.cellHeight = ((Scr_w - 50)*0.5 * (184/353.0)) * 2 + 40;
    
    HomeModel *homeHeadModel = [[HomeModel alloc]init];
    homeHeadModel.cellName = NSStringFromClass([HomeHeadCell class]);
    homeHeadModel.cellHeight = 40;
    homeHeadModel.cellWight = Scr_w;
    
    HomeModel *homeBlankModel2 = [[HomeModel alloc]init];
    homeBlankModel2.cellName = NSStringFromClass([MainCollectionViewCell class]);
    homeBlankModel2.cellHeight = 10;
    homeBlankModel2.cellWight = Scr_w;
    
    
    NSMutableArray *dic = [[NSMutableArray alloc] initWithObjects:homecycleModel, homeBlankModel,homeLaModel,homeBlankModel1,homeItemModel,homeBlankModel2,homeHeadModel,nil];
    StorkSectionModel *secmodel = [[StorkSectionModel alloc]initWithArray:dic];
    [self.dataArray addObject:secmodel];
    [self.adapter reloadDataWithCompletion:nil];
    [self loadData];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController *stpct = [[StorkSectionController alloc]init];
    stpct.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    
    stpct.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        if([model.cellName isEqualToString:NSStringFromClass([NewsCell class])]){
            [[LoginManager shareInsetance] checkLogin:^{
                NewsRItemModel *newModel = (NewsRItemModel *)model;
                NewDetailsViewController *newDetai = [[NewDetailsViewController alloc]init];
                newDetai.model = newModel;
//                NSString *detaiUrl = [NSString stringWithFormat:DetailUrl,[NSString stringWithFormat:@"%ld",[newModel.ID longValue]]];
               // [newDetai loadHtmlWithUrl:detaiUrl];
                [self.navigationController pushViewController:newDetai animated:YES];
            }];
           
        }
    };
    
    return stpct;;
}

- (UIView *)hudBackView{
    if(!_hudBackView){
        _hudBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Scr_w, Scr_h)];
        _hudBackView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5];
        _hudBackView.hidden = NO;
    }
    return _hudBackView;
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
