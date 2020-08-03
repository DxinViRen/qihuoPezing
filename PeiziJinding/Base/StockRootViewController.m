//
//  StockRootViewController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "StockRootViewController.h"
#import "UserViewController.h"
#import "ShopViewController.h"
#import "HomeViewController.h"
#import "LoginManager.h"
#import "LoginViewController.h"
#import "DxRubNavigationVC.h"
@interface StockRootViewController ()

@end

@implementation StockRootViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
  if(self ==  [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //__weak typeof (StockRootViewController *)weakself = self;
   
     [self setControllers];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(logincancelAction:) name:@"logincancel" object:nil];
}

-(void)setWebView{
    
}

- (void)logincancelAction:(NSNotification *)noti{
    self.selectedIndex = 0;
}

- (void)setControllers{
    HomeViewController *home  = [[HomeViewController alloc]init];
    [self addChildViewController:home title:@"首页" image:@"stock_news_homeIcon" selectImg:@"stock_news_homeIcon_select"];
    
    ShopViewController *news  = [[ShopViewController alloc]init];
    [self addChildViewController:news title:@"资讯" image:@"stock_tabIcon_news" selectImg:@"stock_tabIcon_news_select"];
    
    UserViewController *user  = [[UserViewController alloc]init];
    [self addChildViewController:user title:@"我的" image:@"stock_tabIcon_user" selectImg:@"stock_tabIcon_userSelect"];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


- (void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectImg:(NSString *)selectimg{
    childController.title  = title;
    childController.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selImage = [[UIImage imageNamed:selectimg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childController.tabBarItem.selectedImage = selImage;
    //改变字体颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#1296db "],NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    //选中状态颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#d4237a"],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
    DxRubNavigationVC *navi = [[DxRubNavigationVC alloc]initWithRootViewController:childController];
    [self addChildViewController:navi];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if([item.title isEqualToString:@"我的"]){
      if(![[LoginManager shareInsetance] isLogin]){
          LoginViewController *login = [[LoginViewController alloc]init];
          login.modalPresentationStyle = 0;
          [self  presentViewController:login animated:YES completion:nil];
        }
    }
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
