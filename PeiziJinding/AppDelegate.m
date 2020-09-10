//
//  AppDelegate.m
//  PeiziJinding
//
//  Created by D.xin on 2020/8/3.
//  Copyright © 2020 koryv. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "StockRootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //ViewController *view  = [[ViewController alloc]init];
   // NSArray *str = [DateTool getWeekArr];
    StockRootViewController *stokRot = [[StockRootViewController alloc]init];
    self.window.rootViewController = stokRot;
    [self.window makeKeyAndVisible];
    return YES;
}





@end
