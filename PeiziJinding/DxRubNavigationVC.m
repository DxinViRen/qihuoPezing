//
//  DxRubNavigationVC.m
//  RubbishVitor
//
//  Created by D.xin on 2019/10/24.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "DxRubNavigationVC.h"

@interface DxRubNavigationVC ()

@end

@implementation DxRubNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar navBarBackGroundColor:MainColor image:nil isOpaque:NO];
    self.navigationItem.hidesBackButton  = YES;
    [self.navigationBar navBarAlpha:1 isOpaque:YES];
    [self.navigationBar navBarBottomLineHidden:YES];
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 32, 32)];
//    [btn setImage:[UIImage imageNamed:@"navi_back_btn"] forState:UIControlStateNormal];
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
//
//    self.navigationItem.leftBarButtonItem = backItem;
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
        
//        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"navi_back_btn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
         //  backItem.imageInsets = UIEdgeInsetsMake(0, -10, 0, 0);
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
      
            [btn setBackgroundImage:[UIImage imageNamed:@"backWhateIcon"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        //
      
        viewController.navigationItem.leftBarButtonItem = backItem;
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
    
    self.interactivePopGestureRecognizer.delegate = nil;
    
}

- (void)backAction:(UIButton *)btn {
    [self popViewControllerAnimated:YES];
    
    
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
