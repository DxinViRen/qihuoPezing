//
//  UserViewController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "UserViewController.h"
#import "StorkSectionController.h"
#import "UserSecModel.h"
#import "UserHeadCell.h"
#import "HomeHeaderModel.h"
#import "HomeBlankCell.h"
#import "HomeHeadCell.h"
#import "UserItemCell.h"
#import "LoginCell.h"
#import "LoginViewController.h"
#import "MyCollectViewController.h"
#import "AboutUsViewController.h"
#import "FeedbackViewController.h"
@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configDataSource];
    [self.adapter reloadDataWithCompletion:nil];
}

- (void)configDataSource{
    UserSecModel  *headModel  = [[UserSecModel alloc]init];
    headModel.cellHeight = 200;
    headModel.cellWight = Scr_w;
    headModel.cellName  =  NSStringFromClass([UserHeadCell class]);
    headModel.cellInderfier = NSStringFromClass([UserHeadCell class]);
    
    HomeHeaderModel *listBlankModel = [[HomeHeaderModel alloc]init];
    listBlankModel.cellName = NSStringFromClass([HomeBlankCell class]);
    listBlankModel.cellHeight = 15;
    listBlankModel.cellWight = Scr_w;
    listBlankModel.cellInderfier  = NSStringFromClass([HomeBlankCell class]);
    
    UserSecModel  *celectModel  = [[UserSecModel alloc]init];
    celectModel.cellHeight = 60;
    celectModel.cellWight = Scr_w;
    celectModel.extra = [@{@"title":@"我的收藏",@"img":@"myCollectIconUSer"} mutableCopy];
    celectModel.cellName  =  NSStringFromClass([UserItemCell class]);
    celectModel.cellInderfier = NSStringFromClass([UserItemCell class]);
    
    HomeHeaderModel *listBlankModel1 = [[HomeHeaderModel alloc]init];
    listBlankModel1.cellName = NSStringFromClass([HomeBlankCell class]);
    listBlankModel1.cellHeight = 15;
    listBlankModel1.cellWight = Scr_w;
    listBlankModel1.cellInderfier  = NSStringFromClass([HomeBlankCell class]);
    
    UserSecModel  *aboutModel  = [[UserSecModel alloc]init];
    aboutModel.cellHeight = 60;
    aboutModel.cellWight = Scr_w;
    aboutModel.extra = [@{@"title":@"关于我们",@"img":@"userpageAboutUS"} mutableCopy];
    aboutModel.cellName  =  NSStringFromClass([UserItemCell class]);
    aboutModel.cellInderfier = NSStringFromClass([UserItemCell class]);
    
    HomeHeaderModel *listBlankModel2 = [[HomeHeaderModel alloc]init];
       listBlankModel2.cellName = NSStringFromClass([HomeBlankCell class]);
       listBlankModel2.cellHeight = 15;
       listBlankModel2.cellWight = Scr_w;
       listBlankModel2.cellInderfier  = NSStringFromClass([HomeBlankCell class]);
    //fankui
    
    UserSecModel  *fankuiM  = [[UserSecModel alloc]init];
    fankuiM.cellHeight = 60;
    fankuiM.cellWight = Scr_w;
    fankuiM.extra = [@{@"title":@"给我反馈",@"img":@"userhomepageFB"} mutableCopy];
    fankuiM.cellName  =  NSStringFromClass([UserItemCell class]);
    fankuiM.cellInderfier = NSStringFromClass([UserItemCell class]);
    
    HomeHeaderModel *listBlankModel3 = [[HomeHeaderModel alloc]init];
    listBlankModel3.cellName = NSStringFromClass([HomeBlankCell class]);
    listBlankModel3.cellHeight = 15;
    listBlankModel3.cellWight = Scr_w;
    listBlankModel3.cellInderfier  = NSStringFromClass([HomeBlankCell class]);
    
    UserSecModel  *signInModel  = [[UserSecModel alloc]init];
    signInModel.cellHeight = 60;
    signInModel.cellWight = Scr_w-35;
    //fankuiM.extra = [@{@"title":@"给我反馈",@"img":@"fankui"} mutableCopy];
    signInModel.cellName  =  NSStringFromClass([LoginCell class]);
    signInModel.cellInderfier = NSStringFromClass([LoginCell class]);
    
    
    
    
    NSMutableArray *cellArr  = [NSMutableArray arrayWithObjects:headModel,listBlankModel, celectModel,listBlankModel1,aboutModel,listBlankModel2,fankuiM,listBlankModel3,signInModel,nil];
    StorkSectionModel *secModel = [[StorkSectionModel alloc]initWithArray:cellArr];
    self.dataArray = [NSMutableArray arrayWithObjects:secModel, nil];
}

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.dataArray;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
    StorkSectionController  *secCt = [[StorkSectionController alloc]init];
    secCt.configCellBlock = ^(id<MainCellModelProtocol>  _Nonnull mode, MainCollectionViewCell * _Nonnull cell, NSInteger index) {
        
    };
    
    secCt.cellDidClickBlock = ^(id<MainCellModelProtocol>  _Nonnull model, NSInteger index) {
        if([model.cellName isEqualToString:NSStringFromClass([LoginCell class])]){
            //退出登录
            [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"18253575608"];
            //弹出登录界面
            
            LoginViewController *loginv = [[LoginViewController alloc]init];
            loginv.modalPresentationStyle= 0;
            [self presentViewController:loginv animated:YES completion:nil];
        }
        
        else if ([model.extra[@"title"] isEqualToString:@"我的收藏"]){
            MyCollectViewController *mycoll = [[MyCollectViewController alloc]init];
            [self.navigationController pushViewController:mycoll animated:YES];
        }
        else if ([model.extra[@"title"] isEqualToString:@"关于我们"]){
            AboutUsViewController *about = [[AboutUsViewController alloc]init];
            [self.navigationController  pushViewController:about animated:YES];
        }
        else if ([model.extra[@"title"] isEqualToString:@"给我反馈"]){
            
            FeedbackViewController *fedback = [[FeedbackViewController alloc]init];
            [self.navigationController pushViewController:fedback animated:YES];
        }
    };
    return secCt;
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
