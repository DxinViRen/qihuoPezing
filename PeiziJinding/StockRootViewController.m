//
//  StockRootViewController.m
//  JinDingNews
//
//  Created by D.xin on 2020/7/28.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "StockRootViewController.h"
#import "UserViewController.h"

#import "HomeViewController.h"
#import "LoginManager.h"
#import "LoginViewController.h"
#import "DxRubNavigationVC.h"
#import "NewsListViewController.h"
#import "MarketViewController.h"
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
    [self addChildViewController:home title:@"首页" image:@"homeUSNew" selectImg:@"shouyeNew"];//
    
    NewsListViewController *newlist = [[NewsListViewController alloc]init];
    
    MarketViewController *markt = [[MarketViewController alloc]init];
      [self addChildViewController:markt title:@"行情" image:@"marketedUs" selectImg:@"marketed"];
      
    
    
    
    
    
    
    
    
    
    
    
    [self addChildViewController:newlist title:@"资讯" image:@"tabNewsIcon28" selectImg:@"tabNewsListS"];
    
    UserViewController *user  = [[UserViewController alloc]init];
    [self addChildViewController:user title:@"我的" image:@"mainUS" selectImg:@"mainSNew"];
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
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:@"a3a3a3",NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateSelected];
    //选中状态颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MainColor,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateSelected];
    DxRubNavigationVC *navi = [[DxRubNavigationVC alloc]initWithRootViewController:childController];
    [self addChildViewController:navi];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if([item.title isEqualToString:@"我的"] || [item.title isEqualToString:@"积分兑换"]){
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
