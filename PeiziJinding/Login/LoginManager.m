//
//  LoginManager.m
//  RubbishVitor
//
//  Created by D.xin on 2019/10/26.
//  Copyright © 2019 koryv. All rights reserved.
//

#import "LoginManager.h"
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "UserViewController.h"
#import "FeedbackViewController.h"
#import "NewloginViewController.h"
@implementation LoginManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (instancetype)shareInsetance{
    static LoginManager *_shareLoginManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareLoginManager = [[LoginManager allocWithZone:NULL]init];
    });
    return _shareLoginManager;
}



- (BOOL)haveUser{
    return    [[NSUserDefaults standardUserDefaults]objectForKey:@"login"] == nil;
}

- (BOOL)isLogin{
    return  [[NSUserDefaults standardUserDefaults]objectForKey:@"login"] != nil;
}

- (void)checkLogin:(LoginBlock)login{
    if([self isLogin]){
        if(login){
            login();
        }
    }else{
        //弹出登录框
//        UIWindow *keywindow = [UIApplication sharedApplication].windows[0];
//
       LoginViewController *loginviewc = [[LoginViewController alloc]init];
       // FeedbackViewController  *feed = [[FeedbackViewController alloc]init];
        loginviewc.modalPresentationStyle = 0;
//        [keywindow.rootViewController presentViewController:loginviewc animated:YES completion:nil];
        //UserViewController *user = [[UserViewController alloc]init];
        AppDelegate *delegate =(AppDelegate *) [UIApplication sharedApplication].delegate;
        UIWindow *rotWindow = delegate.window;
        StockRootViewController *rootV = (StockRootViewController *)rotWindow.rootViewController;
        [rootV presentViewController:loginviewc
                            animated:YES completion:nil];
    }
}

@end
